import tkinter as tk
from tkinter import ttk, simpledialog
import mysql.connector

class NBAViewer:
    def __init__(self, root):
        self.root = root
        self.root.title("NBA Player Check")

        # Connect to the MySQL database
        self.connection = mysql.connector.connect(
            host="127.0.0.1",
            user="root",
            password="password",
            database="nba"
        )
        self.cursor = self.connection.cursor()

        # Create and configure GUI components
        self.create_widgets()

    def create_widgets(self):
        # Create a label
        label = tk.Label(self.root, text="NBA Database Viewer", font=("Helvetica", 16))
        label.pack(pady=10)

        # Create a dropdown menu for selecting Pos, Age, or Team_Name
        self.option_var = tk.StringVar()
        option_menu = ttk.Combobox(self.root, textvariable=self.option_var, values=["Pos", "Age", "team_Team_name"])
        option_menu.pack(pady=10)

        # Create a button to execute the query and display the Full_Names
        query_button = tk.Button(self.root, text="Show Player list", command=self.show_full_names)
        query_button.pack(pady=10)

        # Create a text widget to display the Full_Names
        self.full_names_text = tk.Text(self.root, width=50, height=10)
        self.full_names_text.pack()

        # Create a button to close the application
        close_button = tk.Button(self.root, text="Close", command=self.root.destroy)
        close_button.pack(pady=10)

    def show_full_names(self):
        # Get the selected option (Pos, Age, or Team_Name) and the value (X)
        selected_option = self.option_var.get()
        x_value = simpledialog.askstring("Input", f"Enter {selected_option} value:")

        # Execute a query based on the selected option
        query = f"SELECT Full_Name FROM player WHERE {selected_option} = %s"
        self.cursor.execute(query, (x_value,))
        results = self.cursor.fetchall()

        # Display the Full_Names in the text widget
        self.full_names_text.delete(1.0, tk.END)
        for row in results:
            self.full_names_text.insert(tk.END, f"{row[0]}\n")

if __name__ == "__main__":
    root = tk.Tk()
    app = NBAViewer(root)
    root.mainloop()