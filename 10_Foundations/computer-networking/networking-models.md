Computer network models are used to represent how data is transmitted and processed between devices on a network. Two prominent examples are the OSI model and the TCP/IP model.

---

- [[osi-model]] is a **theoretical, 7-layer model** used for understanding and teaching networking concepts.
- [[tcp-ip-model]] is a **practical, 4-layer model** that forms the foundation of the Internet.

---

## 1. Summary Table

| Model  | Year Published | Organization    | Purpose                                   |
| ------ | -------------- | --------------- | ----------------------------------------- |
| OSI    | 1984           | ISO             | Universal reference model for networking  |
| TCP/IP | 1981–1983      | DARPA/DoD, IETF | Practical protocol suite for the Internet |

| Feature            | OSI Model     | TCP/IP Model         |
| ------------------ | ------------- | -------------------- |
| Number of Layers   | 7             | 4                    |
| Developed By       | ISO           | DARPA/DoD            |
| Approach           | Theoretical   | Practical            |
| Protocols          | Not specified | Protocol suite       |
| Usage              | Reference     | Implementation       |
| Layer Independence | Yes           | No (tightly coupled) |

---

## 2. Layer Structure

| OSI Model       | TCP/IP Model         | Function/Examples         |
| --------------- | -------------------- | ------------------------- |
| 7. Application  | 4. Application       | HTTP, FTP, SMTP, DNS      |
| 6. Presentation |                      | Encryption, Compression   |
| 5. Session      |                      | Session management        |
| 4. Transport    | 3. Transport         | TCP, UDP                  |
| 3. Network      | 2. Internet          | IP, ICMP, ARP             |
| 2. Data Link    | 1. Network Interface | Ethernet, Wi-Fi, MAC      |
| 1. Physical     |                      | Cables, switches, signals |

- **Note:** In TCP/IP, the Application layer covers OSI’s Application, Presentation, and Session layers. The Network Interface layer covers both Data Link and Physical layers.


---

## **3. Key Differences**

| Aspect                  | OSI Model                         | TCP/IP Model                    |
| ----------------------- | --------------------------------- | ------------------------------- |
| **Layers**              | 7                                 | 4 (sometimes 5)                 |
| **Development**         | Theoretical, reference model      | Practical, protocol suite       |
| **Layer Functions**     | Strictly defined, separate        | Some layers combined            |
| **Protocol Dependency** | Protocol-independent              | Protocol-specific (TCP, IP)     |
| **Usage**               | Used for teaching, design         | Used in real-world networking   |
| **Standardization**     | Standardizes interfaces, services | Standardizes protocols          |
| **Flexibility**         | More flexible, detailed           | More streamlined, less detailed |

