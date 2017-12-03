INSERT INTO Field (name)
VALUES ("News"),
        ("Software"),
        ("Banking"),
        ("Communications"),
        ("Finance"),
        ("Content Management Systems");

INSERT INTO Tool (name, description)
VALUES ("App Annie", "Mobile App Store Optimization"),
        ("Google Maps", "Mapping APIs"),
        ("Rails", "Ruby Framework"),
        ("Akamai", "Content Delivery Network"),
        ("MySQL", "Databases"),
        ("Unicorn", "Web Servers"),
        ("Atom", "Text Editor"),
        ("Slack", "Business Tool, communications"),
        ("Google Analytics", "General Analytics"),
        ("Bootstrap", "Web Framework");


INSERT INTO Code (name)
VALUES ("Python"),
        ("Go"),
        ("C++"),
        ("C"),
        ("Java"),
        ("Ruby"),
        ("Javascript"),
        ("Perl");

INSERT INTO Company (name, FieldID)
VALUES ("Intuit", (SELECT id from Field WHERE name = "Finance")),
    ("Yahoo", (SELECT id from Field WHERE name = "News")),
    ("Google", (SELECT id FROM Field WHERE name = "Software")),
    ("Appfolio", (SELECT id FROM Field WHERE name = "Software")),
    ("Slack", (SELECT id FROM Field WHERE name = "Communications")),
    ("Salesforce", (SELECT id FROM Field WHERE name = "Content Management Systems"));

INSERT INTO Stack (cid, companyName)
VALUES ((SELECT id FROM Company WHERE name = "Salesforce"), "Salesforce"),
        ((SELECT id FROM Company WHERE name = "Intuit"), "Intuit"),
        ((SELECT id FROM Company WHERE name = "Yahoo"), "Yahoo"),
        ((SELECT id FROM Company WHERE name = "Google"), "Google"),
        ((SELECT id FROM Company WHERE name = "Appfolio"), "Appfolio"),
        ((SELECT id FROM Company WHERE name = "Slack"), "Slack");

INSERT INTO toolsinStack (sid, tid)
VALUES ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Intuit"), (SELECT id FROM Tool WHERE name = "Bootstrap")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Intuit"), (SELECT id FROM Tool WHERE name = "Google Analytics")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Intuit"), (SELECT id FROM Tool WHERE name = "Rails")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Yahoo"), (SELECT id FROM Tool WHERE name = "App Annie")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Yahoo"), (SELECT id FROM Tool WHERE name = "Akamai")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Google"), (SELECT id FROM Tool WHERE name = "Google Analytics")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Google"), (SELECT id FROM Tool WHERE name = "App Annie")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Google"), (SELECT id FROM Tool WHERE name = "Google Maps")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Appfolio"), (SELECT id FROM Tool WHERE name = "Rails")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Slack"), (SELECT id FROM Tool WHERE name = "Slack")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Slack"), (SELECT id FROM Tool WHERE name = "MySQL")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Salesforce"), (SELECT id FROM Tool WHERE name = "Google Analytics")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Salesforce"), (SELECT id FROM Tool WHERE name = "Akamai"));

INSERT INTO codeinStack(sid, cid)
VALUES ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Intuit"), (SELECT id FROM Code WHERE name = "Ruby")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Yahoo"), (SELECT id FROM Code WHERE name = "Python")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Google"), (SELECT id FROM Code WHERE name = "C++")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Google"), (SELECT id FROM Code WHERE name = "Python")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Google"), (SELECT id FROM Code WHERE name = "Java")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Google"), (SELECT id FROM Code WHERE name = "Go")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Appfolio"), (SELECT id FROM Code WHERE name = "Ruby")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Slack"), (SELECT id FROM Code WHERE name = "Javascript")),
        ((SELECT Stack.id FROM Stack INNER JOIN Company ON Stack.cid = Company.id WHERE name = "Slack"), (SELECT id FROM Code WHERE name = "Java"));
