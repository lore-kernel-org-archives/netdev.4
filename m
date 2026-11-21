Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795268539;
	b=J4MfW8m3S9Ac35zQ2TxrsCmJZCvySg+y75kRowBKb+4iAce/M7Ci4L65pOF7TBgQvtl/
	 sLTEAfd9ZHNNWSZvw4bcaX5KZGF7Yg+8RdxiJNKmlPwekL5cZwhBxJ6k2UAhKIjDNn1qi
	 rOjOz9u0ACgJ2W0rcPA4dM2UajuzWtPN7Vsq+WjTi7c+zixXYGrhcWsH1HRqUeCtGI8em
	 Ujo/Qt4Wntj248ys0Aswqu1CIcSgJ8Nxf1u+JCEvuBk5/U14srlf0WMHiIb5dCPEStoZI
	 mYU9eq5nPyGIJHsZ3H7KdNweUsobiFVRrM4X4fr5V11DHfmvQke06OSvNuJh18gzO3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=vtaqVeBRcZTOTQsDl2Imu/9QiMYC/4wN4V57DUTyWyw=;
	b=S0gwxQ66GamVO+tvC+NvbQpN0GEu4wTJO+rDNgYwk4XJh520WCc+ovlxjnG21oA+bS3u
	 hlKLdKbyJ5kSlGscnXgPTFotUI98Gt/XNvHTy4LnLM07IboDQj8XMqYqERtHyM/z8j0Qw
	 5gRre34EAAZSLy7kkj2iEjdG33fRaDFIBzu4vD6klYAQhA8Oo0EjBHWFPt0RBO5hVxijE
	 b01HApiWKaEQuCgR1+IZMqPdjhjLpvR1c8LCM5vBmrpTqDmbxc4xMda5j7nvk9/Quhj5G
	 1rDB1oIE7opigcCjIxmZrFivbpBdbmzr5ly5WMp17pK46NmXVTcFX5dOSA5A7fGqcpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W2/StAuW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D5606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 077D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W2/StAuW
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso27126681fa.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 05:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795268537; cv=none;
        d=google.com; s=arc-20260327;
        b=mnDAqhBqbz4tcCwXvzNWX3hetmiWS00CPAJFYafZucMEl8XDdjuaycXlMhXgeuTAwD
         A/X3PYUe/LGFxZA74IRdtsCNGmo2VJd9RGodTbgWwMiGaRBjrUiVhpU5222OfmR4Sns7
         bwFC9xs0bPEPMxSQKuCHjCsptOg2X+FMPwwMWqfStZR4cxRf4rwlU2B4c5E7zsJMyJ0l
         U0lC/udWw9jBRCknvywLwNaA/24OTJgXnPtczFS4xNmz3kNCAqt59+cveTDifUoqAX0f
         L60VlFElwXBFyEv/MXx6FffIqoEYkxqOO5VBI3d+VcRSnUTuiFJ1FOlg2+iYR1H47ylM
         5kTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vtaqVeBRcZTOTQsDl2Imu/9QiMYC/4wN4V57DUTyWyw=;
        fh=/72F3PGXbJF3RNxeccnHtGUnuF22BvrSzYZ38udGe7A=;
        b=qtrQPeOytSl6DgaOprzjbJfR5CfIaXOAaa6XYtA7JcwXWITZHWh5mNebYw/7WP6IFz
         0KZrXg0J2lUGhNcOOH/Td5OxNtTt0Vj7JaGRNtnYYAA+CBQ9DITFNvzfWwsal17I5K+i
         rvg8u7boQac7WdXb9J1npnGiyY6cOnceT8D9YYlZHDBUXKP+cFqyEoO1pkA3chv7Mq7w
         FGG+qntIP9Qa5HfN2c4Jv0gczeRBzXVlp7hg8s2Bty00ShjVScJMiXq538//PXddX0Xt
         9rMUvP3HvVSJ6bD6pv0W0gZEOL4dD7AhOi8x+vIlRn84foqy6g5Xg/iT/SwAItf2EpNs
         LkhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795268537; x=1795873337; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtaqVeBRcZTOTQsDl2Imu/9QiMYC/4wN4V57DUTyWyw=;
        b=W2/StAuWl6KowIVybuIMCpbFzR/mLtRzNjm6us4EDvB4vjNDjWtjSLav2J0DpVUOLO
         LTtlC6SmCE/dMDL+6EelIzO9Giyb2vkNDKSb3WFNAzeqAsa/VS0MkKpBPtVBvJzUKM1G
         uxbx+Auu9HIjeble2v28d4rUVc8l4Mnd9m1mdWPoRy6ofYAZa0V3FTBIH1Akq6a5OcUv
         THkL1ZTzuBclhSuUaRW5mGP64QDwlfR/90uV9yt2Azs/4CVCnkFR/rVUcwJXu8Ik0x3s
         H3p0c2pXL/Hjflx38h5RdiXwMiJ37UujkQ+tS6smFuYyF9xmK6Knvc3Mx3miSb6h01aH
         CLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795268537; x=1795873337;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vtaqVeBRcZTOTQsDl2Imu/9QiMYC/4wN4V57DUTyWyw=;
        b=Vt8V3Ajk+Jmt4BcIlYE4Ljp1QAPhfqUpKVFGyrazyyib3b6oEJp4GOE6pxo44OyFk8
         ulYUtKDq1/WTtv+BAtIPIZa5DZUwXTrfnWgVEUqEakKFr6gCS1U8SxUbvZCo1vofYlG0
         j0gy4emxmjfHvAgoGfpDR5xs/H5U0Vhj8uKVjrozA+W/JD46x3HWVe5A/yF//Hpqb4TK
         zdgPPaHyBVSnfpJ8UkjEGCHpAnJNysMthmJQy/0PLoZCsnpOZu9hGHqwCLyn8PzOqac6
         fJEF0L9YRzhj8Da1fhq39Ac8RRl+Wm8hPbqTRmFnLLgEGR2Oa5qSzcn4moD/9FjDB0Au
         HqfA==
X-Forwarded-Encrypted: i=1; AL+hErG4nOE7zOZoUENHtCnKrtetR0KKNe676713RFugxXtaGGKlbXRdq7Ot6bXD1JEqQvEtbYyXSEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5pUmxy3pKUvrz+gLVrI+eCD1SG6V2NO8CRi+OuoRZ2J+iI/wG
	fI3LWTBTEXZ9eWNNYGFuEmnoilT3wlmNHYN2ayRvy2kgE44GpYj7gZy/6weYVW1fbYoUYa99QdV
	EmAcGI/Oj9U1HQeHR58WM8gCtn8myYtHKIF3bBVN0AQ==
X-Gm-Gg: AZFdTZeqHgM1pwb2EUlGt5iW52yPLANNw1GJq/iNxQUwhx9IfA+hydtcSLT2mL9MjAp
	swKolNBzNescqHIfuRT3TdstLLnu04KbkpZSVX3Js0XIh29EHxLUkU9Nm7SjMeysQtpt5RFpAeK
	3c5VsUPO24TQu7UjYOIP4kBJucFJt3x5yA/tkl169Rf69RwjZS5dNbC7UdjvHW6YkJ1Nz66Bps8
	xoNZ2FJ3x36MKfCdffFFlGlV+cezarXEdPYIfLMIQJ21jzaqg5MGSt/fsiitQwan2N1rMYSBtM4
	8bcMg34G+/uX+P8WXB3+Rxndx4rHoDTEpGMwpH1yoz0MFiiLpeyIEWQsoQ1t9i+/0WwGR6NtR1T
	Mk/26j7Uzlh6+TsyRJlnwM8EHBxsFm3aiF/fCrKEcTTFomoNP8tYMLfbZD3IYionRNJtShJWoQE
	8ioMIzOR+vABpre7GBg/BDeKb8Ow==
X-Received: by 2002:a2e:be12:0:b0:3a3:61ec:43c7 with SMTP id
 38308e7fff4ca-3ae7b821535mr18835101fa.24.1795268536795; Sat, 21 Nov 2026
 05:42:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Ji WANG <jiwangcdi@gmail.com>
Date: Sat, 21 Nov 2026 14:42:05 +0100
X-Gm-Features: Aa3M54ox_Fhq5rgtdb0xyeODuhC_PEfb90klHdfpdRc1DDQ4HTgwjH_GHClYuyc
Message-ID: <CAK5bSyAXjUmef-=NBMx_5+8C==FCQ_YVo0BGOss8ySevtnqHvA@mail.gmail.com>
Subject: [BUG] ovpn: TCP self-deadlock when transport packets loop into the
 ovpn dev
To: antonio@openvpn.net
Cc: ralf@mandelbit.com, sd@queasysnail.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I hit a hard system freeze with ovpn (DCO) in TCP mode. All input
(USB and built-in keyboard) stopped responding, and the only way out
was a forced power-off. The kernel log shows soft lockups on several
CPUs, all spinning on the same sk->sk_lock.slock of the ovpn TCP
transport socket.

Kernel:   7.3.4-1-default (openSUSE Tumbleweed); also reproduced on
          net/main d5b89d55a (7.4-rc3+, 2026-11-20), see below
OpenVPN:  2.7.5 (DCO enabled)
Hardware: Xiaomi Redmi Book Pro 16 2024 (Meteor Lake), Intel AX211 WiFi
Mode:     client, split tunnel (server pushes several routes, no
          redirect-gateway), remote list = UDP v6, UDP v4, TCP v6, TCP v4

Root cause (as far as I can tell from the traces)
-------------------------------------------------
The CPU that holds the lock is CPU#5. Its trace shows ovpn_net_xmit()
being re-entered from inside ovpn_tcp_send_sock():

  udp_sendmsg (userspace app, kdeconnectd)
   -> routed to the ovpn device
   -> ovpn_net_xmit -> ovpn_send -> ovpn_encrypt_post -> ovpn_tcp_send_skb
      [takes sk_lock.slock of the transport socket]
   -> ovpn_tcp_send_sock -> __skb_send_sock -> tcp_sendmsg_locked
   -> tcp_write_xmit -> __ip_queue_xmit -> ip_finish_output2
   -> the encapsulated packet to the VPN server is routed back into the
      ovpn device
   -> ovpn_net_xmit -> ... -> ovpn_tcp_send_skb
      [spins on the same sk_lock.slock it already holds]  => deadlock

In other words, a routing loop: the outer TCP transport packets to the
server are routed back into the tunnel. In my setup the IPv4 server
address (x.y.226.105, TCP 443) is inside one of the pushed routes
(x.y.0.0/16 via tun0), and there is no host route for the IPv4 server
via the physical interface. (For the IPv6 server a host route via
the physical interface does exist.) The trigger was a network change: a
USB-C dock disconnected, WiFi re-associated, and the iwlwifi firmware
crashed and reset. OpenVPN then reconnected and fell back to the IPv4
TCP remote.

Note that this setup is not exotic: OpenVPN automatically adds a host
route to the remote when a pushed route-ipv6 overlaps the IPv6 server
address ("ROUTE6: ... overlaps IPv6 remote ..., adding host route to
VPN endpoint"), but does not do the same for pushed IPv4 routes in
split-tunnel mode. So falling back to an IPv4 remote that is covered by
a pushed route reliably creates the loop.

Strictly speaking, a routing loop like this is a misconfiguration.
Still, other tunnel drivers detect the recursion and drop the packet
("Dead loop on virtual device"). The generic xmit recursion limit
cannot help here, because ovpn deadlocks on the second level already,
while holding a spinlock.
After that, every other user of the socket spins on the same lock as
well: the TCP write timer in softirq (CPU#4), openvpn's close()
(CPU#11), and ovpn_peer_keepalive_work (CPU#17). The machine becomes
unusable.

Reproducer (verified)
---------------------
ovpn-repro.sh (inline at the end of this mail) creates two netns
joined by a veth pair, with an OpenVPN 2.7 server and client over TCP.
The client uses DCO.
The server pushes "route 10.99.0.0 255.255.255.128", which covers its
own address 10.99.0.1, and there is no host route to the server.
I ran it in a virtme-ng VM (4 vCPUs) on the same 7.3.4-1-default kernel
with OpenVPN 2.7.5:

  - DCO + routing loop:          soft lockups on all 4 CPUs within ~15s.
  - DCO + host route (no loop):  tunnel works, no lockup.
  - disable-dco + routing loop:  tunnel is broken, ping-restart after
                                 10s, no lockup.

Same results on net/main d5b89d55a ("net: qrtr: ns: keep notifying local
servers after a failed send", 7.4-rc3+), built with vng --build plus
CONFIG_OVPN=y. The DCO + loop case produced continuous soft lockups
(still stuck at 73s when the VM was killed), with the identical
tcp_write_timer -> ovpn_net_xmit -> ovpn_tcp_send_skb trace. The other
two cases were clean.

In the VM the lock owner enters from the TCP timer rather than from
sendmsg, but it is the same self-deadlock. The timer already holds the
socket spinlock while the transmit re-enters ovpn:

  tcp_write_timer -> tcp_send_loss_probe -> tcp_write_xmit
   -> __ip_queue_xmit -> ip_finish_output2 -> __dev_queue_xmit
   -> ovpn_net_xmit -> ovpn_send -> ovpn_encrypt_post
   -> ovpn_tcp_send_skb -> spin on sk_lock.slock (held by this CPU)

The other CPUs spin on the same lock in tcp_v4_rcv (softirq) and in
ovpn_peer_keepalive_send.

Possibly related: "[PATCH 1/1] ovpn: tcp - defer TX from softirq to
workqueue" (Dao Zhong Ma, 2026-05-01) reports a very similar soft
lockup on sk->sk_lock.slock after suspend/resume. A network change on
resume could produce exactly this loop. But I'm not sure.

Current status: drivers/net/ovpn is unchanged between v7.3.4 and v7.3.5.
torvalds/master (7.4-rc3+), net/main and net-next/main as of 2026-11-20
contain only cosmetic ovpn changes since then, with nothing in the TCP TX
path. So as far as I can tell, this is not fixed upstream. Note that
the existing re-entry guard (peer->tcp.tx_in_progress in
ovpn_tcp_send_sock()) is only checked after ovpn_tcp_send_skb() has
taken sk_lock.slock, so a re-entrant call spins before it reaches the
guard. In the timer path, the outer TCP code already holds the slock
via bh_lock_sock(). In other words, the recursion would have to be
detected before the spinlock is taken.

Workaround: "disable-dco" in the client config.

Traces (trimmed)
----------------
[  started ~13:20:43, right after "tun0: deleting peer with id 0, reason 2" ]

watchdog: BUG: soft lockup - CPU#5 stuck for 26s! [kdeconnectd:1835]
CPU: 5 UID: 1000 PID: 1835 Comm: kdeconnectd Tainted: G L 7.3.4-1-default #1
     PREEMPT(full) openSUSE Tumbleweed
RIP: 0010:native_queued_spin_lock_slowpath+0x6a/0x2c0
RDI: ffff89f8423aa74c R12: ffff89f8423aa600
Call Trace:
 <TASK>
 ovpn_tcp_send_skb+0x53/0x110 [ovpn]
 ovpn_encrypt_post+0x141/0x1d0 [ovpn]
 ovpn_send+0x180/0x240 [ovpn]
 ovpn_net_xmit+0x27b/0x530 [ovpn]
 dev_hard_start_xmit+0x63/0x1c0
 __dev_queue_xmit+0x777/0x1390
 ip_finish_output2+0x18d/0x5b0
 ip_output+0x63/0x100
 __ip_queue_xmit+0x16d/0x460
 __tcp_transmit_skb+0xc93/0x1170
 tcp_write_xmit+0x59d/0x1710
 __tcp_push_pending_frames+0x37/0x110
 tcp_sendmsg_locked+0xdf6/0x1300
 __skb_send_sock+0x15a/0x500
 ovpn_tcp_send_sock+0x82/0x210 [ovpn]
 ovpn_tcp_send_skb+0xc0/0x110 [ovpn]
 ovpn_encrypt_post+0x141/0x1d0 [ovpn]
 ovpn_send+0x180/0x240 [ovpn]
 ovpn_net_xmit+0x27b/0x530 [ovpn]
 dev_hard_start_xmit+0x63/0x1c0
 __dev_queue_xmit+0x777/0x1390
 ip_finish_output2+0x18d/0x5b0
 ip_do_fragment+0x249/0x590
 ip_send_skb+0x90/0xa0
 udp_send_skb+0x185/0x290
 udp_sendmsg+0x8f4/0xea0
 ____sys_sendmsg+0x350/0x3b0
 ___sys_sendmsg+0x7d/0xc0
 __sys_sendmsg+0x80/0x110
 do_syscall_64+0xbe/0x520
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
 </TASK>

watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [swapper/4:0]
RIP: 0010:native_queued_spin_lock_slowpath+0x25e/0x2c0
RCX: ffff89f8423aa74c
 <IRQ>
 tcp_write_timer+0x5c/0x100
 call_timer_fn+0x2a/0x140
 __run_timers+0x204/0x2b0
 run_timer_softirq+0x70/0xc0
 handle_softirqs+0xcc/0x270
 __irq_exit_rcu+0xaa/0x100
 sysvec_apic_timer_interrupt+0x71/0x90
 </IRQ>

watchdog: BUG: soft lockup - CPU#11 stuck for 26s! [openvpn:1256]
RIP: 0010:native_queued_spin_lock_slowpath+0x248/0x2c0
RBX: ffff89f8423aa600 RCX: ffff89f8423aa74c
 lock_sock_nested+0x45/0x80
 tcp_close+0x18/0x80
 ovpn_tcp_close+0x9b/0x140 [ovpn]
 inet_release+0x50/0xa0
 __sock_release+0x51/0xd0
 sock_close+0x15/0x20
 __fput+0xf6/0x2e0
 __x64_sys_close+0x47/0xa0

watchdog: BUG: soft lockup - CPU#17 stuck for 26s! [kworker/17:1:4784]
Workqueue: ovpn ovpn_peer_keepalive_work [ovpn]
RIP: 0010:native_queued_spin_lock_slowpath+0x248/0x2c0
RBX: ffff89f8423aa600 RCX: ffff89f8423aa74c
 lock_sock_nested+0x45/0x80
 ovpn_socket_release+0x33/0x1a0 [ovpn]
 unlock_ovpn+0x5b/0xb0 [ovpn]
 ovpn_peer_keepalive_work+0x13a/0x1e0 [ovpn]
 process_one_work+0x1d3/0x3c0
 worker_thread+0x1b1/0x310
 kthread+0xe6/0x120

All four CPUs spin on the same lock (ffff89f8423aa74c). CPU#11 and
CPU#17 are still stuck at 52s in the second watchdog report.

The reproducer script is included inline below.

I can provide the full untrimmed logs if needed.

Thanks,
Ji Wang

---8<--- ovpn-repro.sh ---8<---
#!/bin/bash
# ovpn (OpenVPN DCO) TCP self-deadlock reproducer
#
# WARNING: if the bug is present, this FREEZES THE WHOLE MACHINE
# (soft lockups, no input). Run it only in a throwaway VM.
#
# Scenario: the client talks to the server over TCP via ovpn/DCO. The
# server pushes a route that covers the server's own IPv4 address, and
# the client has no host route to the server via the physical link.
# Once that route is installed, the outer TCP transport packets are
# routed back into the ovpn device:
#   ovpn_net_xmit -> ovpn_tcp_send_skb [takes sk_lock.slock]
#     -> tcp_sendmsg_locked -> ip_output -> ovpn_net_xmit
#     -> ovpn_tcp_send_skb [spins on the same lock]  => deadlock
#
# Topology:
#   netns ovpnr-srv: veth 10.99.0.1/24, openvpn server (TCP 1194),
#                    tun 10.200.0.1/24
#   netns ovpnr-cli: veth 10.99.0.2/24, openvpn client (DCO),
#                    tun 10.200.0.x/24
#   pushed route:    10.99.0.0/25 via tun
#                    (covers the server 10.99.0.1, beats the /24 on veth)
#
# Requirements: root, kernel with the ovpn module, OpenVPN >= 2.6 built
# with DCO, iproute2, openssl.
#
# Usage:
#   I_UNDERSTAND_THIS_FREEZES=1 ./ovpn-repro.sh
#       trigger the bug
#   I_UNDERSTAND_THIS_FREEZES=1 ./ovpn-repro.sh --with-host-route
#       control run: host route 10.99.0.1/32 dev veth, so no loop
#   DISABLE_DCO=1 I_UNDERSTAND_THIS_FREEZES=1 ./ovpn-repro.sh
#       same loop with DCO disabled (workaround check)
#   ALLOW_BARE_METAL=1 ...
#       skip the VM check
#
# Tip (inside the VM): sysctl kernel.softlockup_panic=1 kernel.panic=10
# makes the VM panic and reboot by itself instead of hanging forever.

set -euo pipefail

SRV=ovpnr-srv
CLI=ovpnr-cli
WORK=$(mktemp -d /tmp/ovpn-repro.XXXXXX)
HOST_ROUTE=0
[[ "${1:-}" == "--with-host-route" ]] && HOST_ROUTE=1

die() { echo "ERROR: $*" >&2; exit 1; }

# ---- safety checks -------------------------------------------------------
[[ "${I_UNDERSTAND_THIS_FREEZES:-}" == "1" ]] || \
    die "This may hard-freeze the machine." \
        "Set I_UNDERSTAND_THIS_FREEZES=1 to run."
[[ $EUID -eq 0 ]] || die "must run as root"
if [[ "${ALLOW_BARE_METAL:-}" != "1" ]]; then
    virt=$(systemd-detect-virt 2>/dev/null || true)
    [[ -n "$virt" && "$virt" != "none" ]] || \
        die "not running in a VM (set ALLOW_BARE_METAL=1 to override)"
fi
for c in openvpn openssl ip; do
    command -v "$c" >/dev/null || die "missing: $c"
done
openvpn --version | head -1 | grep -q '\[DCO\]' || \
    die "openvpn built without DCO"
modprobe ovpn 2>/dev/null || [[ -d /sys/module/ovpn ]] || \
    die "cannot load ovpn module"
modprobe tun 2>/dev/null || true

cleanup() {
    for ns in $SRV $CLI; do
        ip netns pids "$ns" 2>/dev/null | xargs -r kill 2>/dev/null || true
    done
    sleep 1
    ip netns del $SRV 2>/dev/null || true
    ip netns del $CLI 2>/dev/null || true
    echo "logs kept in $WORK"
}
trap cleanup EXIT

# ---- certificates (self-signed, verified via peer-fingerprint) ------------
cd "$WORK"
for n in srv cli; do
    openssl req -x509 -newkey ec \
        -pkeyopt ec_paramgen_curve:prime256v1 -nodes \
        -keyout $n.key -out $n.crt -days 1 -subj "/CN=$n" 2>/dev/null
done
fp() { openssl x509 -in "$1" -noout -fingerprint -sha256 | cut -d= -f2; }
SRV_FP=$(fp srv.crt)
CLI_FP=$(fp cli.crt)

# ---- namespaces + veth ---------------------------------------------------
ip netns add $SRV
ip netns add $CLI
ip link add veth-srv netns $SRV type veth peer name veth-cli netns $CLI
ip -n $SRV addr add 10.99.0.1/24 dev veth-srv
ip -n $CLI addr add 10.99.0.2/24 dev veth-cli
for ns in $SRV $CLI; do
    ip -n $ns link set lo up
done
ip -n $SRV link set veth-srv up
ip -n $CLI link set veth-cli up
# Control run: pin the server address to veth with a host route
# (/32 beats the pushed /25).
if [[ $HOST_ROUTE -eq 1 ]]; then
    ip -n $CLI route add 10.99.0.1/32 dev veth-cli
fi

# ---- server --------------------------------------------------------------
cat > srv.conf <<EOF
dev tun
dev-type tun
proto tcp-server
local 10.99.0.1
port 1194
mode server
tls-server
topology subnet
server 10.200.0.0 255.255.255.0
cert $WORK/srv.crt
key  $WORK/srv.key
dh none
peer-fingerprint $CLI_FP
# The bug trigger: a pushed route that covers the server's own address.
push "route 10.99.0.0 255.255.255.128"
keepalive 2 10
verb 4
EOF

# ---- client --------------------------------------------------------------
cat > cli.conf <<EOF
client
dev tun
proto tcp-client
remote 10.99.0.1 1194
nobind
cert $WORK/cli.crt
key  $WORK/cli.key
peer-fingerprint $SRV_FP
verb 4
EOF
# DCO is the default when available. DISABLE_DCO=1 runs the same loop
# in userspace mode (workaround check).
if [[ "${DISABLE_DCO:-}" == "1" ]]; then
    echo "disable-dco" >> cli.conf
    echo "disable-dco" >> srv.conf
else
    grep -q disable-dco cli.conf && \
        die "cli.conf must not contain disable-dco"
fi

ip netns exec $SRV openvpn --config srv.conf --daemon \
    --log "$WORK/srv.log" --writepid "$WORK/srv.pid"
sleep 1
ip netns exec $CLI openvpn --config cli.conf --daemon \
    --log "$WORK/cli.log" --writepid "$WORK/cli.pid"

echo "waiting for the tunnel..."
for _ in $(seq 30); do
    grep -q "Initialization Sequence Completed" "$WORK/cli.log" && break
    sleep 1
done
grep -q "Initialization Sequence Completed" "$WORK/cli.log" || \
    die "tunnel did not come up, see $WORK/cli.log"
grep -qi "dco" "$WORK/cli.log" || \
    echo "warning: no DCO mention in client log, DCO may not be active"

echo "client routes:"
ip -n $CLI route
echo
echo "route to server from client:"
ip -n $CLI route get 10.99.0.1
echo
echo "sending traffic into the tunnel (this is where it should lock up)..."
sync
ip netns exec $CLI ping -c 5 -W 1 10.200.0.1 || true
ip netns exec $CLI ping -c 5 -W 1 10.99.0.100 || true

echo
echo "no lockup so far, check dmesg:"
dmesg | grep -E "soft lockup|ovpn" | tail -20 || true
---8<--- end ---8<---
