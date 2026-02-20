import tkinter as tk
from tkinter import ttk

def main():
    window = tk.Tk()
    window.title("Table Counts")

    tree = ttk.Treeview(window, columns=("Table", "Count"), show="headings")
    tree.heading("Table", text="Table")
    tree.heading("Count", text="Count")
    tree.pack(fill="both", expand=True)

    with open("table_counts.txt", "r") as f:
        for line in f:
            parts = line.strip().split(": ")
            if len(parts) == 2:
                table, count = parts
                tree.insert("", "end", values=(table, count))

    window.mainloop()

if __name__ == "__main__":
    main()
