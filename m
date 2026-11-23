Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401355;
	b=AyximDi8LOSfU4YLvepAXNm6xLxD8TE2i+m3sXSZrp/DyX/Uhp3ppNSRUh0qpYN0/QzC
	 4rMCBuiRZjV+x+c8zx3pzRBOcN713PDMUqREvx1xKFiB1I8V9rO+tAWgN09kRCjq/+gSl
	 KcFgMd50qqr2gJfLCMVF4Wbg5HkYwa/3eiS1ptADyerSl581bm43/W5ZHoH8r7ck0g3Wa
	 oZedPUV+KC9ZElLNMo26nwlruZsKo//sUaJDleOdB6nBoblHNruX56mJruVq3aqVvqFLA
	 XIxHN5GO/gz+tFbshrWr4OAKETnuWtxPffo0EKb3X3YB97XgHJeWREUdX2e9tQZJgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
	b=qzUNx02Wh7/lA3miWVQdB1BoRRhjH1E6soKDffTQAkkV0UXffaqH3Ks0sdYPcMnewb9O
	 WToqGW2VnR0NdMT8gVT3EydLx6trgyr1XOpvQOMxG/4feIwEQ6o7xpwotJXg9f1MQbYYG
	 L7n17cfNxi5BF208vPIMvMuIJrUbKgn6EAl+BdMsnTeN54j2hf/IqypD8AOqAF/oVr543
	 lZFcGUTZ0Ab6Syw4u4XtoeyBY0sX2ZL57dn8D9OnDD7M7FqNtrYVwC1sdxlrzLesSoPdB
	 /S8CyPjVbDnGnJXxSW4FOSQQLrigDXdWcCehjQ/0U7MHA/URNOiyfmQ497hXNtxHSIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=BJCrS3JH;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C73606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=BJCrS3JH
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0414c1062so14146685ad.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401354; x=1796006154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
        b=BJCrS3JHZno1ZOGCIRrsnBlhxJL7LQiQbtgUazIMUf1wxGRUVwTAiN3WZHnkVH0aP4
         4XG4QAc6ow+9yekJ46j9bdcsIEQNsezCcArr+GlIxsfqXKUBjYOpUnKJ0nP+ZnsiP+u3
         8o6Dfh23f+59hbZTTCYiRhQahRZSgboDcy3Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401354; x=1796006154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zta3sFkY9ZZMc3gNgFpjOMOV1WUQyr5rBabD1DfSZCg=;
        b=abDk2gTU/EYfDISVPyrT5RchDYgUNnW19R39cWLcqw0qt2/FCRqDYUKz2jnWtgP33r
         Fr9mJOiht2MdaUZ40+RtZ6bqePbesPpuzoXPhCtL2/imq5zsq4Y1qm7Xb+F4s27nsB7z
         RHMxcO1smrTSRwyfIPYyxs+NmvUgEscIWT65hGJjH6kqlr8NDlcLYo9ZsdCxX07DDxmN
         RJAvycEljWwEOmJMKtP99Fbzy5LWTqMG0UodtCmfuLd3pltG/xVBTyZjq/RNY3mhSNap
         uEVkK4ICB3rtj/FQppxecU3P20vMwnEfpUPLzDFQa4SYK+43zNAXuaUrgohb+9buA3WF
         PwTQ==
X-Forwarded-Encrypted: i=1; AL+hErEpuGm1KjKlNpHw9VRxtcd6TR/0EFbQl4mApZCmds0m/4m/TKJvyqamSGn05K/GC/RUGrnFBRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z92ssseRmiu0TYYtTbFkf0d9RRuc/VLAdryQvVzt7KFzh6gKgs5
	V/TMBP5nNIYExu0mrH5TS9PlqSelOC3sG7BzD406d78Ou96nxCR3SdDBpUtMwfX2siFkApEik4i
	BinUoWXA=
X-Gm-Gg: AZFdTZfvYDLVWSjJyuHej9mBndq/gInoh6MgUE9ggRx50jKhsxZHgyofEDJD79VepzW
	Go/vbr+x/rNaFL0UVqHvy9HJGb2RCNyMiobPjbOi3f4DhdFx4VBH+Orshoxip35Rqsef8fzgAFu
	Rls3XAvAPloj+wuWK6W16dRiWRtqhgNrovJgLtI+yukVOAAZyZ16WwfKzKUoA7KDuiiS5MK4xKY
	cuYALXUFQXkivS9oZQ00ZuwIvd/6TMDNyJ9QXCOa4171SPXspUYqc1jK2A4zRyqM72LXhNwTeKh
	nAeV5dus2D4D45oUaVQZGIzUYj0wWxf/7WUIuULxAo6j7jGjwGEHxDEVFngSLZVNkPdQWFTVQKx
	L0Zq6nV+j/a78Olqaz69mH2lLbH7NKGk+Dm7m6aq9ZvW9mJzpR9KeNOnolELeTKWaG84MLvjcRs
	Qmsw2EccYtKql6RPLH2SwMAdv4MGqklQmNlCea2SBycBeyV9dUD5GcFqXA6fbza4BLpA/GR1rpN
	ccJlWg7uEKZrcnP0/VYoObqwKlP8WJSvqT74EX5YG8Du9QISKwWGiS9cuAsa8Pte421hVHsDDi9
	KOn/G4gG6cTglHdRkOFgzAoeTHTpSOT21oB5xZSAkB8dEUIFXh/DEgO20o/+Q9TE8/NEeScXX/N
	VIxS7shhCgxfwSF6ELBRNg+2d9l0b1AbkIC3hoNmaIKlJ4CNsQO/EEhQ/gNUa4kt0
X-Received: by 2002:a17:903:32ce:b0:2ef:ed25:514a with SMTP id d9443c01a7336-2f03f16ac68mr91947455ad.44.1795401354275;
        Sun, 22 Nov 2026 18:35:54 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm43609925ad.59.2026.11.22.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:53 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/nfc: a 16-bit truncation in nfc_llcp_allocate_snl() overruns the SNL response skb and BUGs the kernel
Date: Mon, 23 Nov 2026 08:05:47 +0530
Message-Id: <20261123023548.3351531-1-piyus@iiitd.ac.in>
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

nfc_llcp_allocate_snl() accumulates its allocation size in a u16 while the
length it is given is a size_t.  An SNL PDU carrying enough SDREQ TLVs makes
that sum wrap, the response skb is allocated far too small, and
nfc_llcp_send_snl_sdres() then puts the full TLV list into it: skb_put()
trips skb_over_panic() and the kernel BUGs.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN.  A patch is in the next mail of
this thread.


1. Root cause

net/nfc/llcp_commands.c, nfc_llcp_allocate_snl():

	struct sk_buff *skb;
	struct nfc_dev *dev;
	u16 size = 0;                           <-- u16
	...
	size += LLCP_HEADER_SIZE;
	size += dev->tx_headroom + dev->tx_tailroom + NFC_HEADER_SIZE;
	size += tlv_length;                     <-- tlv_length is a size_t

	skb = alloc_skb(size, GFP_KERNEL);

The caller is net/nfc/llcp_core.c, nfc_llcp_recv_snl(), which walks the TLVs
of a received SNL PDU and builds one SDRES TLV for every SDREQ it finds:

	case LLCP_TLV_SDREQ:
		...
add_snl:
		sdp = nfc_llcp_build_sdres_tlv(tid, sap);
		if (sdp == NULL)
			goto exit;

		sdres_tlvs_len += sdp->tlv_len;
		hlist_add_head(&sdp->node, &llc_sdres_list);

and at the end passes the accumulated length:

	if (!hlist_empty(&llc_sdres_list))
		nfc_llcp_send_snl_sdres(local, &llc_sdres_list, sdres_tlvs_len);

The accounting on this side is exact - every entry added to the list also
adds its length - so the list and sdres_tlvs_len always agree.  What does
not agree is the u16 inside the allocator.

An inbound SDREQ TLV costs three bytes (type, length, tid, with an empty
service name), and the SDRES it produces is four, so sdres_tlvs_len is four
thirds of the PDU's TLV area.  About 48 KiB of SDREQs therefore pushes it
past 65535.  nfc_llcp_send_snl_sdres() then walks the list regardless:

	hlist_for_each_entry_safe(sdp, n, tlv_list, node) {
		skb_put_data(skb, sdp->tlv, sdp->tlv_len);

		hlist_del(&sdp->node);

		nfc_llcp_free_sdp_tlv(sdp);
	}

With 16400 SDREQs the accumulated length is 65600, which truncates to 64,
and the skb that should have held 64 KiB holds none of it.


2. How the PDU gets large enough

The NCI data path reassembles fragments before the LLCP layer sees them
(net/nfc/nci/data.c, nci_add_rx_data_frag()), so the PDU that reaches
nfc_llcp_recv_snl() is not limited to one NCI packet: a sequence of
PBF_CONT fragments accumulates into one skb, and the final fragment
delivers it.  The reproducer uses 64 KiB fragments.

The LLCP MIU negotiated for I-frames does not bound this path; SNL is
handled directly out of the receive skb by nfc_llcp_rx_skb(), and
nfc_llcp_recv_snl() walks whatever linear area that skb has.


3. KASAN reports

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-nfc-snl-skb-over-panic-mainline-7.4-rc3.txt):

  skbuff: skb_over_panic: text:ffffffff87e134e6 len:382 put:4
          head:ffff88801d2016c0 data:ffff88801d2016c4 tail:0
  kernel BUG at net/core/skbuff.c:215!
  Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
  Workqueue: events nfc_llcp_rx_work
  RIP: 0010:skb_over_panic+0xcd/0xd0
   skb_put
   skb_put_data
   nfc_llcp_send_snl_sdres
   nfc_llcp_recv_snl
   nfc_llcp_rx_skb
   nfc_llcp_rx_work
   process_scheduled_works

"put:4" is one SDRES TLV; the skb had no tailroom left for it.

The same reproducer on 7.3.1 gives the identical BUG at the line that
skb_over_panic() occupies in that tree (skbuff.c:214,
kasan-nfc-snl-skb-over-panic-7.3.1.txt).


4. Impact

A kernel BUG() in a workqueue context: the machine panics with
panic_on_oops, and otherwise the worker thread is killed with the LLCP
local's locks still held, which wedges the NFC stack.

The overflow itself never writes past the allocation, because skb_put()
checks before copying - this is a denial of service rather than memory
corruption.  It is reachable by whoever can deliver an SNL PDU to an NFC
device: an NFC peer over the air, or a local process that owns an NFC
device able to inject target-mode data.  No capability check stands between
a peer's PDU and this path.


5. Reproducer

nfc_llcp_snl_sdres_overflow.c in this directory (sent off-list on request;
see the note at the end).  It brings up a virtual NCI device, answers the
kernel's bring-up commands, activates target mode, then delivers an SNL PDU
of 16400 SDREQ TLVs across PBF_CONT fragments.  It BUGs the kernel within a
second on both trees.


6. Suggested fix

Hold the size in a size_t, so the value that reaches alloc_skb() is the one
the caller computed:

	-	u16 size = 0;
	+	size_t size = 0;

A request that large can now fail the allocation instead of wrapping, and
both callers of nfc_llcp_allocate_snl() already handle the IS_ERR() return.

The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched
kernel is clean on the same reproducer; ordinary LLCP traffic (SYMM, CONNECT,
I-frames, an SDREQ/SDRES exchange of a few TLVs) still works with the patch
applied; net/nfc/llcp_commands.c and net/nfc/llcp_core.c are byte-identical
between 7.3.1 and af6737b90668, so nothing in between changes this path.

Not checked: real hardware - all of this is on a virtual NCI device under
QEMU.  We have not tried to drive the path from an over-the-air peer.

No Fixes: tag is given: the u16 has been in nfc_llcp_allocate_snl() since
the SNL support was added, and our clone of net.git does not reach that
commit.  Happy to add the exact tag if you would like one.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
