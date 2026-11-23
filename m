Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444595;
	b=bS6UkARaIpT6iKdKxPvbSB8ykMA25XCJtT+Wyhpp/Sh+Ag1K6sO0QyQvJwaTwUSjIuBr
	 jgcxbz16JeFeUOCWzeeDCyg0AZvqJNlsoGbi6UPvWdtEFqWLpX445Z6PX4j2c7CO0vuWG
	 /VXEGrOMgMUSEtcZqb7fGEx15CChCS1nVqnhN2tf5+dFsy6ZYYJPqNOf2bMdtKX3UF1Vw
	 4qKNw4sDrl++TU+BhzxpKKM+GLDPBGSzjsVTDYeEUhErJ4JgJWo0gjyGLhs/fqZuYR7Ax
	 QUU8r+G0Yu5hynj/1eCViDfgnZ5Zh+ZEz7cdocY6F4aHJLvUmtra/+4oc2mzVbF7hTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ehRimsJYB3Ch55Y8eVy07JQEbqg0JrRGoOw4sSOHi78=;
	b=nFe4CVzDMi/YA1giGLDbfSxMkJqZXfAwzPAOzJouI3y2nvF85tJ9M66pHOOtZk106urj
	 xrZ/aC2WwZGDTe99nSohU5VkI+H2I1GTBHl55rLukSH5WQxGYBXHGXj8aO0ZFho63peav
	 OUih77eXeu/6iMfpSMCkRmFe1hdXSxsST5L1zgd2ZeKFeVEd/l+v5/b3pXd+HH6uCu8cl
	 0K9aPxeWyPneV4pQv417W6w7xBw4SnFFiv1CPiYJmoifYE+86ymUtGzNLtrZaltXfi5au
	 +g83SYd1QEZnRFABd5m9of5OSLgvn+QIUY747wPuDdYeSQ33IEFmX5pj3xpeQgogi6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=AnccZPWW;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E6D606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E6D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=AnccZPWW
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04bea9a93so28311175ad.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795444593; x=1796049393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehRimsJYB3Ch55Y8eVy07JQEbqg0JrRGoOw4sSOHi78=;
        b=AnccZPWWxApE8C7F8ef8F1nyqmuie0g7OtihE5H0iGKBFsVGEZAv1U0L195NboFEG8
         nBggwRfvjhv39Myhzm9UjQvOLBbo6J1mCXRKDhYbxS+xrK6hiE6iaBNkLq1kgjU4Yy49
         SFEmfPFmXPENCyBbY5HsY9ddOzwthwbrruy6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444593; x=1796049393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehRimsJYB3Ch55Y8eVy07JQEbqg0JrRGoOw4sSOHi78=;
        b=DinpHAXarssN+r+dbju/4HiucjyEybaJUXOLAJnE0G4RANPZAjyEX3VWO+ivXYx2My
         qZ0DqDUdeT5lqOKrwiOGnWp6Rfw0h0M84y374gJJEJEdYlaD7DpQs//G7UPDy6OgenHo
         NZe6DltQLjU2MnGgZ7spRXTuvuCmKYvKh4vUPUt7E5Lm7JKuAQ7xDABr/Ylg5SqqcbJW
         RpfZl2rHyq47neh8rtn7KeCAxb0Oxv3npuavqSL/uUGju3M+6Qx/hS5QVP8h3UTmma7F
         jZlbZm2Y3eAwHMJrAJVLGwixr6h9cimeOATmkvQO8/7sCl2659YGFhOEY2G07quf8T1Y
         r5Rg==
X-Forwarded-Encrypted: i=1; AL+hErGksVv/E94awAbkqwORaRUYToFzVDrZsx7Y/1YKTYdXLRH7Vlh6EMiUMkpx48rZRwCgAyXVxhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VXxvd1qEsbl/jFRcUuTQ5WYTxfKO552nvEKR4mW8BwpxZUMws
	CKO9XpA09fCl6KvuK76gk75dNBq478Y7LbE4KjD763KFyc82eDO8lbpEMOXIFdz8WU4=
X-Gm-Gg: AZFdTZc3p7yuGO5xpUlEVuFvYK8UwQ7Sf7gA2N0ul0wLxYvmy18RNbBMu+U3p7dJqpi
	e3baH5A7/vTQ0tUc4O2125kpYGDNglqjDsm6f3hhReNzEx8H10RcGgADkPHM63Lp6F5LP2B7HU7
	yjtKbivgitp2NvL2SYIn0BhKMhbFpSVbgho8fJ5xg4YFS+GGLFX3yR1c0Lofwp/Sq+a1x+oHvpA
	FNfhHyJ+rZqHQMAf+WX/rne7vA1LU/WCrN6uPxYAScOc6LXeVux7TPofP3ofUs3NC7GZ3EKjzCK
	Z3IcHsXu2RN1x5JImyl+0EVje7507m9NwCnd8JlVDVmNmHVU6GH5pViV9gI80v8VGazUhXWyR1p
	UbqO3zetVjKjUtLHg/kg7vx6KwzR1SgwcbMX6ek3Tz6NYgm4X6JrzQy1VgQXUxap0uVp8cDdyuN
	v94HQbQp1DzrjrEQ1S0hFlnoB2r0mU1klv/RUSN+YuGhA3GabWYYz2Ly9zMLa2/GQ3E5GxMw0ES
	0aeuty1LkSELwg0jx2Fh+d3VSRnPgL5XAxmddLtuOfvWMog8120KUcQUDmIolSAXRzxQAVcYp+q
	XCdT2+Mi56igXfzrMX6i5hjvgdAsgTyopxY38Xp6IioPh1SD5QlcTGDz6WoNSTp3g4mEqFt/H8L
	xn5g1NJjPTeg0/zTqS4L1L40TxmI4Eupl0hTz56n0ZWSKSvZHyh5emKGbFMD5GsmTqw==
X-Received: by 2002:a17:902:e847:b0:2ef:cf8a:622f with SMTP id d9443c01a7336-2f03f1cf5d7mr114757805ad.17.1795444593265;
        Mon, 23 Nov 2026 06:36:33 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee85466sm54062085ad.4.2026.11.23.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:36:32 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] can: j1939: NULL dereference when a peer completes a session with no data queued
Date: Mon, 23 Nov 2026 20:06:24 +0530
Message-Id: <20261123143625.4021586-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

j1939_session_completed() passes the session's skb to the socket layer
without checking that there is one.  A peer that completes a transport
session whose data packets never arrived makes j1939_sk_recv_one()
dereference NULL.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN.  A patch follows in this thread.


1. Root cause

net/can/j1939/transport.c, j1939_session_completed():

	if (!session->transmission) {
		se_skb = j1939_session_skb_get(session);
		/* distribute among j1939 receivers */
		j1939_sk_recv(session->priv, se_skb);
		consume_skb(se_skb);
	}

j1939_session_skb_get() resolves the session's current offset through
j1939_session_skb_get_by_offset(), which returns NULL when no queued skb
covers it:

	struct sk_buff *skb = NULL;
	...
	if (!skb)
		netdev_dbg(...);
	return skb;

j1939_sk_recv() then walks the bound sockets and j1939_sk_recv_one()
dereferences the skb on its first statement:

	static void j1939_sk_recv_one(struct j1939_sock *jsk, struct sk_buff *oskb)
	{
		const struct j1939_sk_buff_cb *oskcb = j1939_skb_to_cb(oskb);
		...
		if (oskb->sk == &jsk->sk)

sk_buff::sk is at offset 0x18 on x86_64, which is the faulting address in
the report below.  consume_skb() tolerates NULL, so the dereference is the
only fault on this path.

The same getter is checked by both of its other callers in this file -
j1939_session_tx_dat() returns -ENOBUFS, and j1939_xtp_rx_dat_one() warns and
cancels the session - so this looks like an omission rather than an
invariant.


2. How a peer reaches it

By sending an End Of Message Acknowledgement for a session with nothing
queued, so that the session is completed before any data packet arrives:

  j1939_can_recv()            net/can/j1939/main.c:108
    j1939_tp_recv()           net/can/j1939/transport.c:2201
      j1939_tp_cmd_recv()     net/can/j1939/transport.c:2153
        j1939_xtp_rx_eoma()   net/can/j1939/transport.c:1439
          j1939_xtp_rx_eoma_one()       :1424
            j1939_session_completed()   :1247

Everything on that path is driven by received CAN frames, so on a shared bus
this is reachable by any node; locally it needs only the ability to send on a
CAN interface (the reproducer uses vcan).


3. KASAN report

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-j1939-null-session-skb-mainline-7.4-rc3.txt):

  BUG: KASAN: null-ptr-deref in j1939_sk_recv+0xd4/0x3c0
  Read of size 8 at addr 0000000000000018 by task x/9440
   j1939_sk_recv
   j1939_xtp_rx_eoma
   j1939_tp_recv
   j1939_can_recv

j1939_sk_recv_one() and j1939_session_completed() are inlined in that build.
On 7.3.1, where net/ is built without inlining, the same reproducer names
every frame separately (kasan-j1939-null-session-skb-7.3.1.txt):

  BUG: KASAN: null-ptr-deref in j1939_sk_recv_one+0x34/0x170
          net/can/j1939/socket.c:318
   j1939_sk_recv_one          net/can/j1939/socket.c:318
   j1939_sk_recv              net/can/j1939/socket.c:363
   j1939_session_completed    net/can/j1939/transport.c:1247
   j1939_xtp_rx_eoma_one      net/can/j1939/transport.c:1424


4. Impact

A NULL dereference in softirq context, from the CAN receive path: an oops
that kills the receiving context and, with panic_on_oops, the machine.  It is
a denial of service, not a corruption - address 0x18 is not mappable on any
supported configuration.

net/can/j1939/socket.c and transport.c are byte-identical between 7.3.1 and
af6737b90668, so nothing in between changes this path.


5. Reproducer

j1939_eoma_null_session_skb.c in this directory (sent off-list on request;
see the note at the end).  It brings up vcan, binds a J1939 socket, and
sends the connection-management frames that complete a session with no data.
It faults within a second on both trees.  CONFIG_CAN, CONFIG_CAN_J1939,
CONFIG_CAN_VCAN and KASAN are required.


6. Suggested fix

Test the skb before using it, in the shape the file's other callers already
use:

	+		if (se_skb) {
			/* distribute among j1939 receivers */
	-		j1939_sk_recv(session->priv, se_skb);
	-		consume_skb(se_skb);
	+			j1939_sk_recv(session->priv, se_skb);
	+			consume_skb(se_skb);
	+		}

Deliberately without a netdev_warn(): a session completed with no data
queued is the peer's protocol error, not a kernel one, and a warning on this
path would let a peer flood the log.

Cancelling the session rather than dropping the completion may be the more
correct protocol response.  We left that alone so the patch stays a fix for
the dereference; say the word if you would rather have the session cancelled.

The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched kernel
is clean on the same reproducer; ordinary J1939 transport sessions (a
multi-packet transfer over vcan, RTS/CTS/DT/EOMA) still complete and deliver
with the patch applied; both j1939 files are byte-identical between 7.3.1 and
af6737b90668.

Not checked: real CAN hardware - all of this is vcan under QEMU.  We have not
tried this from a second node on a physical bus.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
