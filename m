Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401329;
	b=nt8htg9llbQ5TNEv+Rj3qmUDRzexNFAdfMjA6JPDVNEh0rVZ0Zb5yVRNZ5dcmtnj/GYD
	 76wvUjlge4bonPckS5WwymGWM5MO5knanxx8VtfUB4acTe5a1HJO6qhdtn3Q6hj6oQP/b
	 1yDWSZF5hZJ9EJ6WeZ9su1tgO2lnJ1hxT1cxr1691s/8kThgFM9/txu7WpHCgaQJnOuSF
	 A1+mWbrroqQbdksc4VQWNPOo5Bm2gh02HqNrpz+SqIRTpBe7hbeaQrXkhKvw/v2cQ2/Fl
	 TBkq0HDyfmfmF7mdF2WpvtlkO2f+95kaVM3GaDhqtDFzy7h9gkusGfNCDQEL+VC/5jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
	b=IdnDe4HcNbhlaGrQGe2oVxT75f6EIJ51rZrxTJeHCFwqQzKnskI95b0Y4+tbckUxNPfT
	 Thzi97nKSDofQ7P9n0ZEvUTWNq5qiL7Y5fM3sLWgX9pnMCfvtdcYqpVeZP2TkDUTNVlru
	 4UQZfq3KNM1DpLhRcmTg2k67XE1cxCpatrQ/KhautDegFJTQhVOKh4QPObNr/saxrBVYw
	 3gM05/TDmU8MTbi+xBm69aa+8sAa0oY4yxKpNgGyWNKcQLvi9JHH0Z33ZamZ4kdr98D5c
	 bM/2t927URdGpoHs6hcUBaQuPOtBp4GjZplutSI9XdggBU+/FeEdA1R/c01YnwoOuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=JWyMJlAY;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B76F606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B76F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=JWyMJlAY
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0634667aaso6046555ad.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401325; x=1796006125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
        b=JWyMJlAYm2RXQzI4xBM89/ScssdzvaZgHDsbe065tXlq/WtmDm0W54RISKwsO2Iwqc
         +vAmBLHqIR7YbStgCfF5FS1dGVgee1kWiivbU2nPwVwPKTkgrocCoXJsU6elVVKhlAeu
         wxKMk+Zx7Qyv/gvjbSum8eBBmhLiTqxI4ashM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401325; x=1796006125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EPn2+dOiCjCMUGOzXUCg9W8kUFJdJYMWemu9cFlc1Q=;
        b=mspXnBjNIJhREC35hFVWdGPNObwBLpu4CAN7yVRw8DWWqwsHPhXZkvkCFh94cbQ2do
         6K5dP5QJe6WZ1NOkHJh25+Q8pqciFZpoTNoS9o8DO115qoi0PcjOOiG8ZUaB2+a3QhHu
         TyNT+54phKzkK0925IBjqCOMjZ5XdsNar69GUU5zTNBoUQPCfTZ48cViFBUaYrOO5f56
         eqUTa/p5CLQn914nMAi9YWpZGTCvKsw0HEsqCu/x7UqzjDV22lRNCiraHEntVIz8MAVC
         dfkFUu4QCxO5W36SMIaHJUnPiqsDvlBOfEMpkXVwVM/x9vFiXtzH7byqMQT0a2e2p3Gf
         yENw==
X-Forwarded-Encrypted: i=1; AL+hErEdt2cqdcW3acT+kinsHdPNrTU10wFjuOzdVB7CARtGilPhGgET4NoTqIExVtMwXUFndqVUccY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ICUnNdCfaum5Bm0ny+8+5a/4ytWRTIwPus+MYbFCWVsjiOHf7
	tAsTt7AiATvtQYBR7ioDlm3v8L0aI1qlBJOQA7OO0EQoash3yE34h+kN0tv+G6ZUXag=
X-Gm-Gg: AZFdTZe040KY41vxjHom9bokXVRMiEA7nA5MTj0ONW78yAeJDmDLSVtIVeK8faD4p5Q
	TN/RssqxYRM1RaJig6RVhTBQcpAS+atBYFqcFjD98EboaVWYwOaXoVwBVxMEoi5z0v7PHdD/mhq
	zGSWXGzGHKRf/uGogqA6CK4cQqVZBEv2h8uWb2J6haR6AGyL9CGdDxP0IEQNbF9li5t4Wy8LvTc
	d8dmqblznAebZ/RqwhDSkOwQENnb5gwQECvQKfdZsTMyXg5rq39jzVKGlwvGNek6t5B+spacHHa
	ueM7GoDwlGfK5HIaW813DCj8m0ERVqEMVZsG8MBObMMLdY6NElyIjst59NEMhqIY3Dfz+t7HlKv
	YYiQAZM6kt+RG7syoOaQqi2E8r4WO/fHD5mIdvod4y+iJQgU9/Q29TtCekQUw1GwD0/rGMCWMMI
	ebbTvnXzaeBgI8KKsGbcROgYOuI0MYFIIqp3pCfEDJleAUUVc7hENuozDJu8JDmwLxjxVgz0KvJ
	LwM8li52Pn3sjIdCsavzlAZzS5pr4kJaZL0+16SZjnXgyfLfLH5LdNHJUiyc3d1rSLdekNxWuDU
	6HSowWnTT4bAKLNhse+8T74p6+jiiUx+deaoCo+f4/PrFtm92mY5OIk7fsabhGrJXNbFEFeihh3
	rBlHG5dikrcHk82cBOUZ6Fxwue25s1Peq4pKbPJl5j0Tt9VqM9cBTjvlZf3XzIDUD
X-Received: by 2002:a17:902:e88b:b0:2e9:569a:214d with SMTP id d9443c01a7336-2f03f2533abmr67096005ad.43.1795401325369;
        Sun, 22 Nov 2026 18:35:25 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm44320685ad.63.2026.11.22.18.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:24 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/nfc: LLCP takes the skb reference after queueing it to the socket, so a concurrent recvmsg() frees it first
Date: Mon, 23 Nov 2026 08:05:18 +0530
Message-Id: <20261123023519.3350997-1-piyus@iiitd.ac.in>
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

nfc_llcp_recv_ui() and nfc_llcp_recv_hdlc() queue a received frame to an
LLCP socket and only then call skb_get() on it.  Between those two steps the
skb is on sk_receive_queue at refcount one and a concurrent recvmsg() can
dequeue and free it, so the skb_get() increments freed memory.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN, at both sites.  A patch is in
the next mail of this thread.


1. Root cause

net/nfc/llcp_core.c, nfc_llcp_recv_ui() (and the same shape in
nfc_llcp_recv_hdlc()):

	/* There is no sequence with UI frames */
	skb_pull(skb, LLCP_HEADER_SIZE);
	if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
		/*
		 * UI frames will be freed from the socket layer, so we
		 * need to keep them alive until someone receives them.
		 */
		skb_get(skb);
	} else {
		pr_err("Receive queue is full\n");
	}

sock_queue_rcv_skb() does not take a reference of its own: __sock_queue_rcv_skb()
calls skb_set_owner_r() and skb_queue_tail(), taking over the reference the
caller holds.  The moment it returns, the skb is visible on the receive
queue and whoever reads the socket owns it.  A reader that gets there first
dequeues and frees it, and the skb_get() that was meant to keep it alive
then operates on a freed object:

	refcount_t: addition on 0; use-after-free.

The comment above the call describes the intent correctly - the socket layer
will free it, so a reference is needed - but the reference has to exist
before the skb is published, not after.

The intended final state is unchanged by taking it earlier: the caller
(nfc_llcp_rx_skb(), via nfc_llcp_rx_work() or nfc_llcp_recv_agf()) drops its
own reference with kfree_skb() when the dispatch returns, leaving the socket
queue holding the last one.


2. Both sites, and why the aggregated-frame path finds it so easily

	nfc_llcp_recv_ui()    net/nfc/llcp_core.c:930   (SOCK_DGRAM, UI frames)
	nfc_llcp_recv_hdlc()  net/nfc/llcp_core.c:1144  (SOCK_STREAM, I frames)

Both are reached from nfc_llcp_rx_skb().  nfc_llcp_recv_agf() splits an
aggregated frame and dispatches each sub-PDU through nfc_llcp_rx_skb() in a
loop, freeing each one immediately afterwards:

		new_skb = nfc_alloc_recv_skb(pdu_len, GFP_KERNEL);
		...
		skb_put_data(new_skb, skb->data, pdu_len);

		nfc_llcp_rx_skb(local, new_skb);

		kfree_skb(new_skb);

so one AGF PDU delivers many frames to the socket back to back, which is
what makes the window easy to hit from userspace.

The same file already uses the correct ownership rule for the raw-socket
copy a few hundred lines above:

	if (sock_queue_rcv_skb(sk, nskb))
		kfree_skb(nskb);


3. KASAN reports

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN.

The I-frame site (kasan-nfc-llcp-hdlc-skb-uaf-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb+0x17b3/0x34a0
  Write of size 4 at addr ffff888055abe5e4 by task kworker/1:2/56
   kasan_check_range
   nfc_llcp_rx_skb            <-- __refcount_inc, skb_get, nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb            <-- the AGF loop's inner dispatch
   process_scheduled_works

  (rx_skb+0x17b3 resolves to skb_get at include/linux/skbuff.h:2004,
   inlined by nfc_llcp_recv_hdlc at net/nfc/llcp_core.c:1144.)

The UI-frame site (kasan-nfc-llcp-ui-skb-uaf-mainline-7.4-rc3.txt):

  BUG: KASAN: slab-use-after-free in nfc_llcp_rx_skb+0x3a5/0x34a0
  Write of size 4 at addr ffff888055973724 by task kworker/1:3/2203

  (rx_skb+0x3a5 resolves to skb_get at include/linux/skbuff.h:2004,
   inlined by nfc_llcp_recv_ui at net/nfc/llcp_core.c:930.)

On 7.3.1, where net/ is built without inlining, the same two reproducers
name the refcount helpers directly - once on the increment and once on the
matching decrement, depending on which side of the race loses:

  refcount_t: addition on 0; use-after-free.
   __refcount_add
   skb_get
   nfc_llcp_recv_hdlc
   nfc_llcp_rx_skb
   nfc_llcp_recv_agf
   nfc_llcp_rx_skb
   nfc_llcp_rx_work

  BUG: KASAN: slab-use-after-free in __refcount_sub_and_test

(kasan-nfc-llcp-{hdlc,ui}-skb-uaf-7.3.1.txt.)


4. Impact

A four-byte increment on freed slab memory, with the value and the timing
controlled by an unprivileged reader of the LLCP socket: it is the same
primitive as any refcount-on-freed-object bug, and the freed skb can be
reallocated between the free and the increment.  The decrement side can also
land on a reallocated object, which is what the __refcount_sub_and_test
report above shows.

Reachable by whoever can deliver LLCP frames to the device (an NFC peer, or
a local process owning an NFC device) together with any local process able
to read the corresponding LLCP socket.


5. Reproducers

nfc_llcp_hdlc_skb_uaf.c and nfc_llcp_ui_skb_uaf.c in this directory (sent
off-list on request).  Each brings up a virtual NCI device, binds an LLCP
socket, and then races frame delivery against recvmsg().  Both fault within
a few seconds on both trees.


6. Suggested fix

Take the reference before the skb is published, and drop it again if the
queueing fails - sock_queue_rcv_skb() frees nothing on any of its failure
paths, so the extra kfree_skb() balances exactly the reference taken here:

	+	skb_get(skb);
	+	if (sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
	+		pr_err("Receive queue is full\n");
	+		kfree_skb(skb);
	+	}

at both sites.  The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: both sites fault on net.git main under KASAN; the patched kernel is
clean on both reproducers; the refcount accounting with the patch applied
ends in the same state as the original intent (socket queue holds the last
reference, the dispatcher's kfree_skb() drops its own); ordinary LLCP
datagram and stream traffic still delivers with the patch applied;
net/nfc/llcp_core.c is byte-identical between 7.3.1 and af6737b90668.

Not checked: real hardware; an over-the-air peer.

No Fixes: tag is given: both sites date from the original LLCP receive
implementation and our clone of net.git does not reach that commit.  Happy
to add exact tags if you would like them.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
