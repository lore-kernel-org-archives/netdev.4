Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169832;
	b=er/fKK8EwsflrzNR6RhhD8z0SiSak/tOiR4rFGzi8y0dVPE/47qWmrvhZkwLoQyBvLqA
	 YkMVhvnl1BC6njhgDIL6z28LPYPvxSV8j0/OYbqsJ15iS7GJKJYb6RNcieSzeuGzHBQDX
	 +dOLmbNSN0l98rPAZ0jq28XRbGntzkg9vQDYIMQckG5pEGRhcMG0T47EX38i7eWZPYG6K
	 5tCMJs4ksINS7seQXzSK+P5s7i9m8BW/fvR5wLyGxrNp0SaCrOKlMh3VoLCUB80lsRShA
	 pAZn0uuNsZX7k6T7Y9A89ZVXP7mvWmHBqHgXv6Hw39CWVb8V1CH6Zq4d05HYgOhccpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169832;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:X-Change-ID:
	 Content-Transfer-Encoding;
	bh=8KVwAeucdyBTF8sdUPeaorzAfr9w0KHwK24SslldF2M=;
	b=uGZcKk+LgYhyhCPPzSB2WcYoE8cajLCpEjqMwfDHZJuUvmoLZddlv3iqbemf2f8I7QNw
	 hhCIrrEnJe+NboVIELMZh8m5xPD4c3i40iiG9ajfJOWRnr4FWT2DAE6gQKidCLABVHgJO
	 J3OZrCHzjMj+wvkGs00KtjODkz35McB9CxmJK2LTiwcRWRG3pBO9+0bCpRf2tbUGrUdDz
	 4ByX2bqQHrIOR2ockNdpxh9lfgC4m9WMq0ITlhCTpEXMETMq/2KczqGWgS/xJ8M6HNOUL
	 u+kolkzQ3UHyuFUGj6fGZt2VtBRlz6Td4MH11J7GUN8Vgl29ieMB8xXXyDDPhUN7/kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OSy7QUbo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=x8w9Tcff;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE10606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE10606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OSy7QUbo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=x8w9Tcff
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795169829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8KVwAeucdyBTF8sdUPeaorzAfr9w0KHwK24SslldF2M=;
	b=OSy7QUboKAVjBoSw1YxrL/gpUm2WgSmB+itcepEfqvUwPvTipwPpKXyg84+IS5uV0btkg9
	NPU4jrfFyKnAx3pGsyG55KHv0ykNpV2hooE+bBN9DUCGwK4OxDzHFw3aCGX3qVoc4NIhZk
	txJCipTwvma/SVIQJ1kAGibGe1oJkFXT+B0YnuwnNUvfQ4KlmvxLCwCk3hrMUaWWujToAR
	VMwoAcIgFArUqit6Wt5fe53rJ7MFAnOjwXTDC7/G01BJci0FURr7z2blt4HfYtHHN/SOzB
	0YRivJnJPLdLSGFRdrcXkvqsmGEbUxwscOVDGOfuqsi8RB65zh2+Q2fgmlTqyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795169829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8KVwAeucdyBTF8sdUPeaorzAfr9w0KHwK24SslldF2M=;
	b=x8w9TcffeNUAfSe+o5HaO3xPHCTbUSsK0jfO82XAL5kuzTO1dZdldnA1fFAfAj86rNE+by
	ZUbwSMlP5SrlHGBg==
To: netdev@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Felix Maurer <fmaurer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Neelima Muralidharan <neelima@ti.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Pratheesh Gangadhar TK <pratheesh@ti.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next v11 0/8] hsr: Allow to send packets on specific port and pass the timestamp
Date: Fri, 20 Nov 2026 11:16:56 +0100
Message-ID: <20261120-hsr_ptp-v11-0-264c88f4f1d0@linutronix.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260204-hsr_ptp-1f6380f1d35f
Content-Transfer-Encoding: quoted-printable

I am trying to extend linuxptp to support PTP over a HSR network.

This is the kernel side of the changes. In short PTP over HSR sends its
packets to a multicast address and every node needs to forward the PTP
packet (SYNC and FOLLOW-UP for instance) within the HSR ring.
In order to achieve this, the HSR stack must not duplicate and forward
the PTP packets as it would do with other packets. The delay caused by
the duplication and forwarding adds overhead which in turn makes the
timing information within the PTP packet inaccurate.
The PTP stack needs to forward the packets so it is aware of the delay
and can update the PTP packet (the FOLLOW-UP) accordingly to the delay.

My current approach is to open the slave devices (eth0/ eth1) from
userland in order to receive the PTP packets. Sending happens from the
hsr0 device. The actual packet has an inline header prepended of type
struct hsr_inline_header. The size of the header is equivalent to
ethhdr. The header has a type (h_proto) at the same position as ethhdr
and expects it to be ETH_P_1588 as this extra meta information is only
relevant for PTP packets. It makes no sense to send PTP packets via the
HSR interface because it gets duplicated and the timestamp information
is lost so this should not break anything. As an additional safe guard
there is a magic value at h_source position. The value has '0xaf' at the
most significant byte which makes the address a locally administered
multicast address.

The header passes two information from userland: On which slave port
the packet has to be sent and does the HSR stack need to prepend a
header or not.
hsr_inline_header::{has_hsr_header =3D 1, req_tx_port =3D HSR_INLINE_HDR_PO=
RT_A]=20
will send the packet on port PORT_A and it carries already a HSR tag.
hsr_inline_header::{has_hsr_header =3D 0, req_tx_port =3D HSR_INLINE_HDR_PO=
RT_B]=20
will send the packet on port PORT_B and add system's HSR tag.
The header is skipped so that the remaining stack sees the actual data
and can send it as requested.

The PRP packets are sent directly via the SLAVE interface. The standard
mandates not add a PRP trailer (PRP, redundancy control trailer) to PTP
packets. There is not really a reason to use hsr interface.

HSR hardware offloading is optional. The driver needs to know if the
operating mode is HSR or PRP. In PRP mode it needs to check the ether
type and for ETH_P_1588 it must not perform any offloading.
In HSR mode, for ether-type ETH_P_1588 there must be no offloading. If
the ether-type is ETH_P_HSR there must be no offloading if the
encapsulated protocol is ETH_P_1588.
Driver with offloading support enabled need to be updated to handle
these cases correctly. Also their firmware may need to be updated if
cut-through forwarding is supported. This is not part of the series.

This has been tested in a pure software environment and in an HW-assisted
environment where the HW is able to duplicate and deduplicate packets
but does not do it for PTP packets.
It has not been tested within an environment where the HW is able to
forward the PTP packet and correctly update the timing information.

---
v10=E2=80=A6v11: https://patch.msgid.link/20261104-hsr_ptp-v10-8-2c4a38ad97=
3c@linutronix.de
- Moved uapi/linux/hsr_ptp.h to hsr_device where it is used.
- Moved inlines header parsing into its own function
  (hsr_ptp_parse_header())
- hsr_ptp_parse_header() now unconditionally does
  skb_reset_mac_header(). sahshiko keeps complaining about the
  conditional reset.

v9=E2=80=A6v10: https://patch.msgid.link/20261014-hsr_ptp-v9-0-2d20a2a0f816=
@linutronix.de
- A few patches got their commit description updated/ corrected as
  suggested by Daniel Machon.
- A few variables (local and uAPI) have been renamed to get alligned:
  - tx_port -> req_tx_port
  - hsr_hdr has_header has_foreign_header -> has_hsr_header
  Suggested by Daniel Machon.
- hsr_forward_do() got two comments updated to be more clear what it
  does. Suggested by Daniel Machon.
- sashiko
  - noticed that skb_cow_head() needs also be adjusted by the size of
    skb_metadata_len()
  - hsr_dev_xmit() verifies that __pad0 and __pad1 of the supplied
    hsr_inline_header is 0.
  - hsr_dev_xmit() does skb_reset_mac_header() if the MAC header was not
    yet set.
  - Earlier sashiko pointed out that #4 does not consider VLAN headers
    in hsr_handle_frame() while checking for PTP packets. I updated the
    commit message saying that I don't check/ ignore VLAN because I have
    no working setup and can't validate that the whole chain is working.
    Now sashiko pointed out that this is not true (not checking VLAN)
    because __netif_receive_skb_core() "unpacks" the VLAN header via
    skb_vlan_untag(). This looks correct so I removed that part from the
    commit message since it should the right thing here. However it is
    still not verified.
  - The selftest has been updated to verify that SRC-MAC and the HSR
    sequence number is the supplied one if the HSR header was supplied.

v8=E2=80=A6v9: https://patch.msgid.link/20261002-hsr_ptp-v8-0-60dabc07e554@=
linutronix.de
- Use skb_postpush_data_move() for the data move
- A few patches got their description updated so that the bot does
  hopefully not complain about a few things that are meant to be (such
  as skipping PRP).

v7=E2=80=A6v8: https://patch.msgid.link/20260928-hsr_ptp-v7-0-d55d304d9a7e@=
linutronix.de
- Use __u8 instead of uint8_t, add header file for in hsr_ptp.h
- Add header file to if_hsr.h for struct ethhdr
- Remove the inline keyword from hsr_ptp_test.c=20

v6=E2=80=A6v7: https://patch.msgid.link/20260923-hsr_ptp-v6-0-6ea07b3fb8a8@=
linutronix.de
- Change the logic in hsr_create_tagged_frame():
  - Don't update ->csum_start (the cloning takes care of this)
  - pskb_may_pull() does not need to include HSR_HLEN (it only copies
    'movelen')
  - Set network header to 'movelen' which takes VLAN into account
- Drop also PTP packets which were received on HSR_PT_INTERLINK (not
  just HSR A/B).
- Move include HSR header to include/uapi/linux/hsr_ptp.h, so it is also
  available in userland.
- selftests:
  - Add hsr_ptp.sh alphabetically ordered to the Makefile
  - Use "$0" in hsr_ptp.sh
  - Drop unnused arguments in open_socket()

v5=E2=80=A6v6: https://lore.kernel.org/r/20260527-hsr_ptp-v5-0-158a7633eac0=
@linutronix.de
- hsr_ptp_test: Let it wait up to 100ms for a packet. Otherwise it will
  complain if the recevied packet is not already in socket.
- Use TEST_GEN_PROGS instead TEST_GEN_FILES, the test can not run
  without additional arguments.
- Make the inline header mandatory for sending ETH_P_1588 packets via
  the HSR device.
- Use kfree_skb() instead kfree() for the skb.
- Rephrase the commit message saying that skb_clone() shares
  skb_shared_info and does not copy it.

v4=E2=80=A6v5: https://lore.kernel.org/r/20260508-hsr_ptp-v4-1-aa19aa7c6a71=
@linutronix.de
- Split the patch into smaller pieces
- Added a test for the added inline header (which signals the port while
  sending packets).
- Replaced __pskb_copy() with skb_clone() + skb_cow_head() in
  hsr_create_tagged_frame() to preserve timestamp request.

v3=E2=80=A6v4: https://lore.kernel.org/r/20260429-hsr_ptp-v3-1-afbf8f200f48=
@linutronix.de
- Removed skb extention. The information within HSR is passed via
  struct hsr_frame_info. Driver with HSR-offloading capabilities need to
  know the HSR mode (HSR or PRP) and parse the skb to decide what needs
  to be done (whether to send on both ports and if adding a header is
  needed).

v2=E2=80=A6v3: https://patch.msgid.link/20260309-hsr_ptp-v2-0-798262aad3a4@=
linutronix.de
- Remove af_packet changes entirely.
- Add an internal header to pass additional information for HSR-PTP
  packets.
- Remove PRP, userland will use slave devices directly.
- Drop all received PTP packets. Userland needs to use the slave device
  for RX.

v1=E2=80=A6v2: https://patch.msgid.link/20260204-hsr_ptp-v1-0-b421c69a77da@=
linutronix.de
- Added PRP support
- skb extention is used instead of extending struct skb_shared_info
- in af_packet
  - packet_sendmsg_spkt() is no longer extended
  - jump labels are used to avoid the overhead if there no socket that
    is using this HSR extension.

---

---
Sebastian Andrzej Siewior (8):
      hsr: Add header_ops::parse_protocol
      hsr: Use skb_clone() while adding the HSR header
      hsr: Add a magic header for sending PTP packets
      hsr: Drop received PTP packets
      hsr: Use the port and header information in hsr_forward_skb()
      hsr: Assign a socket for cloned skbs
      hsr: Move struct hsr_ethhdr to a global header
      selftests: hsr: Add test for the inline PTP header on HSR

 MAINTAINERS                                    |   1 +
 include/linux/if_hsr.h                         |   6 +
 include/uapi/linux/hsr_ptp.h                   |  20 +
 net/hsr/hsr_device.c                           |  81 +++-
 net/hsr/hsr_forward.c                          |  86 +++--
 net/hsr/hsr_forward.h                          |   3 +-
 net/hsr/hsr_framereg.h                         |   2 +
 net/hsr/hsr_main.h                             |   5 -
 net/hsr/hsr_slave.c                            |  34 +-
 tools/include/uapi/linux/hsr_ptp.h             |  20 +
 tools/testing/selftests/net/hsr/.gitignore     |   1 +
 tools/testing/selftests/net/hsr/Makefile       |   5 +
 tools/testing/selftests/net/hsr/hsr_ptp.sh     | 109 ++++++
 tools/testing/selftests/net/hsr/hsr_ptp_test.c | 496 +++++++++++++++++++++=
++++
 14 files changed, 820 insertions(+), 49 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20260204-hsr_ptp-1f6380f1d35f

Best regards,
--=20=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>

