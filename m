Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401295;
	b=rlaieEjXQljo3vs3/70i+0r5RMXMMWjSzSrvo3eY5wRugmfJpTnZoQ6KqhipI6YgKeD+
	 UfMwGKshXbVNQPi4kkVKhQi44GxzDecW+QiFcemlo+HFdIkj+t7AwvRbBToAco6JogZLg
	 pw9ydw2SaAyeeKOOpJChsBpztJxC++vq09bZ21OUZN8xPFulj3HsYwqTiCIO8rHl//gFc
	 6CEOAFqpovBScZLT1kgLJ/wjg3p0l+JcwUianr3GJvEGWp5Q8ZYrXoFEtHNBhdJmZbUv2
	 v9V7uKt+RicpEsnrFuU3iHQ83KCmkgnEoAmFN9SWVh6bzOnNK5tmQd2rsgPzOBFCC3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Oc64KSmd4BfTK59u2VDQ0x7zgg8Szh+LnQVeqvI2Iw=;
	b=Dqb2Uav9PgRrjUJwtJD/8/U1ssyDs8inzB7Wj0PPcpDdPN8U4zSkqdIVmg1E7782Id+s
	 wnrzyFo0cD4srsEKdLhghfXmpN7W/ZrZ9Eb53XlmBYWsAtRqFye1pLp1SV+PuNYsYBLxX
	 Cq0qLGRY3G6aZZnmuCwAVczK9xJuBBdmz+1OPfnpgRle93+eIoWVUN2mmzZVN+Vuugby6
	 RA6TQEU2qj6B3h+Tw5NLB58bcDVci9bZD5jphlLlVpjM5Iez+qz9Htl445UPKoPO+MSsk
	 x+s3GgcWJIitFNp0uNNBJIulxqAesKOFiT6ZirzXVfFQWcwj/+AfN+QO/wv2WznAb9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=QLxu+y7F;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ECD606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96ECD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=QLxu+y7F
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f01f296937so21604365ad.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401292; x=1796006092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Oc64KSmd4BfTK59u2VDQ0x7zgg8Szh+LnQVeqvI2Iw=;
        b=QLxu+y7Fm2VIy4RbXDQxjQ7wI9+oWbCtRPMd7r5VI+DfwXU2ZCdDvrhEbMM56m77AY
         MBoL8wXvOIb7bhsjkAIDAUBk5redv94wdUGfgmpWIa1+bD+Cd1b9w1W7o9j/VX3iyoDc
         Ufvp8RqJIrOVgO5bN7D27e2u2fT1SbaLOJ3zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401292; x=1796006092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Oc64KSmd4BfTK59u2VDQ0x7zgg8Szh+LnQVeqvI2Iw=;
        b=Arda/RBKJpR1FV+qJIDzRNCG26QaGeUHJnoiDVN1KT6+prcnApUo5IJHfs26MpQ1Y9
         VF3ZO2jIApC8k4HsZ10xVGpKo5PqnnWLVQPipQLqVGNBdnMGHfYnJNGDs7Fv3VKl1sPj
         gm8GUU5Pi9sF9iPNYoS/B1BQdXbGBTDiPHGhNs5qNeMwXoKnnonymgFGMLWztykCCW7l
         C5f1REi75jttQiPm0TAzIXnc4kYZzDL4Ugd7c69EjGTGTO798hifwEZb2UpoyhMD+csn
         bIq7jqUrcI28ezt5q6vxo6Vl47EL4RV51Jkf8Vz28daP79A3aUSZPFKIKV8aCeX2WTY3
         oGUw==
X-Forwarded-Encrypted: i=1; AL+hErEhpPfDGkGOqnWVnn7BsATnlh3ZQgdmgPksSSDBPTR89+fSFVlYNycsqF6X3BuSbXMD105mg1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pkSZf538SQgZfwfs385mLm/9r5KNpYQ6U/FYD8J48g0lc8k02
	f7Lix5TFW+7rzn4hWu6TxC+tJBFQkxrNmQWEk+qAbrWGr81C0A9Z361yyRYmHfPX+s4=
X-Gm-Gg: AZFdTZc0ymw9yWMb/Nz1lEGrb4awm5/He13lM20PeJbLrnbccumjFad0YwZb/mZe1Ql
	9bycmqFX+/sfrg8+yU8F9JxX8xXgd152tgPBujug0XT5uFrIag9WlIHMGOU/Jay/dB/onFGQQBe
	YwklGfZtpyIUC0Nhots4uarM5aSSft/55sHKSRG0+nUlq1NxczHXRH3WS7rQ8UzeH+pCbsKvrCe
	FWksaHAQ/DT9zEnWV9wH6vWzUEc7+YhlUdEo1GWghuwv5F/16sM8SLEroxUYx6nr3FtWIrn74Bs
	XhbqavX1kElIpWQ8wOPHGwiLgzXMYrjpGX+DBczVekJtQAo01+VugnlONm3a4Qhv/mG4Zjs8ksd
	JAZgL/AewbalfyCJoTOU6TPaKcj9qBojBVKpY2OsOmWrdoGHeMry5R7kG7/IGtGWNcu/KitsPfR
	+aG1QhsPsswrUeNoZ1yR0UUngG9653L5xT/37uTaYuNSHpOzudmldLMt0Ldp7sudddMCwopa9Zo
	V7wdLogWnQWYpaZ/blB9vttZAtgKTEWd2y/SKKYZx0GwRZk0oCG9hBK8pOeumeMgUGwFlkrS+WU
	phRRThJQ5GagBMq6jBTVWTHFMl5Un0MKdTIq2k7aZi8Fohvbfqh+ZPqgWjtxnOLJKFZc9D77ick
	B8VirSfKf7j5AJyV1f3vqzuenN/Qv9umtMSQjcLVzM2jwI7w4jTFnhfxMCrF2q6st
X-Received: by 2002:a17:903:1aed:b0:2f0:a814:de43 with SMTP id d9443c01a7336-2f0a814e02amr695025ad.57.1795401291903;
        Sun, 22 Nov 2026 18:34:51 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm44590425ad.7.2026.11.22.18.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:34:51 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/nfc: nci_add_rx_data_frag() hands a NULL skb to the nfc core when the reassembly cannot grow
Date: Mon, 23 Nov 2026 08:04:45 +0530
Message-Id: <20261123023446.3350387-1-piyus@iiitd.ac.in>
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

nci_add_rx_data_frag() frees the skb and sets the local pointer to NULL when
it cannot make room for the data accumulated so far, and then falls through
to the exit path it shares with the success case.  In target mode that NULL
is passed to nfc_tm_data_received(), and the LLCP receive path dereferences
it.

Reproduced on net.git main at af6737b90668 ("net: af_key: fix use-after-free
in dump_sp()"), 7.4.0-rc3-01164, with KASAN.  A patch is in the next mail of
this thread.


1. Root cause

net/nfc/nci/data.c, nci_add_rx_data_frag():

	if (ndev->rx_data_reassembly) {
		reassembly_len = ndev->rx_data_reassembly->len;

		/* first, make enough room for the already accumulated data */
		if (skb_cow_head(skb, reassembly_len)) {
			pr_err("error adding room for accumulated rx data\n");

			kfree_skb(skb);
			skb = NULL;              <-- cleared here

			kfree_skb(ndev->rx_data_reassembly);
			ndev->rx_data_reassembly = NULL;

			err = -ENOMEM;
			goto exit;               <-- and carried into the exit path
		}
	...
exit:
	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
		/* Data received in Target mode, forward to nfc core */
		err = nfc_tm_data_received(ndev->nfc_dev, skb);
		if (err)
			pr_err("unable to handle received data\n");
	} else {
		nci_data_exchange_complete(ndev, skb, conn_id, err);
	}

nfc_tm_data_received() does not test the skb (its only NULL test is on
dev->dep_link_up), nfc_llcp_data_received() tests the LLCP local and not the
skb, and __nfc_llcp_recv() then dereferences it:

	static void __nfc_llcp_recv(struct nfc_llcp_local *local, struct sk_buff *skb)
	{
		if (!pskb_may_pull(skb, LLCP_HEADER_SIZE)) {

pskb_may_pull() reads skb->len, which is offset 0x70 on this build - the
address in the report below.

The other branch is already correct: nci_data_exchange_complete() accepts a
NULL skb (it prints "len %d" as `skb ? skb->len : 0` and passes it to the
callback with the error), which is how the pending data exchange learns the
fragment was lost.


2. How the failing branch is reached

skb_cow_head() has to fail, and the length it is asked for is the
accumulated reassembly:

	reassembly_len = ndev->rx_data_reassembly->len;
	if (skb_cow_head(skb, reassembly_len)) {

A peer controls that length.  Each PBF_CONT fragment is appended to
ndev->rx_data_reassembly, and the next fragment's head must then be expanded
by the whole accumulated size with a GFP_ATOMIC allocation inside
pskb_expand_head().  Growing the reassembly to a few hundred KiB with
PBF_CONT fragments and then sending one more makes the expansion fail
reliably rather than occasionally - the reproducer does exactly this, with
64 KiB fragments, and faults on the first run every time.


3. KASAN report

net.git main, 7.4.0-rc3-01164-gaf6737b90668, KASAN (full log attached as
kasan-nfc-nci-null-skb-mainline-7.4-rc3.txt):

  BUG: KASAN: null-ptr-deref in nfc_llcp_data_received+0x93
  Read of size 4 at addr 0000000000000070 by task kworker/u8:0/13
  Workqueue: nfc2_nci_rx_wq nci_rx_work
   skb_headlen             include/linux/skbuff.h:2527
   pskb_may_pull_reason    include/linux/skbuff.h:2860
   pskb_may_pull           include/linux/skbuff.h:2875
   __nfc_llcp_recv         net/nfc/llcp_core.c:1625
   nfc_llcp_data_received  net/nfc/llcp_core.c:1657
   nfc_tm_data_received
   nci_add_rx_data_frag
   nci_rx_work

The same reproducer on 7.3.1 gives the same fault named one frame deeper
(null-ptr-deref in skb_headlen, kasan-nfc-nci-null-skb-7.3.1.txt), because
net/ is built there without inlining.


4. Impact

A NULL dereference in the NCI receive workqueue: an oops that kills the
worker and, with panic_on_oops, the machine.  It is a denial of service, not
a corruption - address 0x70 is not mappable on any supported configuration.

Reachable by whoever can deliver NCI target-mode data to the device: an NFC
peer over the air, or a local process owning an NFC device.  The only extra
condition is memory pressure the same peer creates by choosing the
reassembly length.


5. Reproducer

nfc_nci_reassembly_null_skb.c in this directory (sent off-list on request).
It brings up a virtual NCI device, activates target mode, accumulates a
large reassembly with PBF_CONT fragments and then sends the final fragment.


6. Suggested fix

Test the skb before forwarding it, leaving the other branch alone:

	+		if (skb) {
	+			err = nfc_tm_data_received(ndev->nfc_dev, skb);
	+			if (err)
	+				pr_err("unable to handle received data\n");
	+		}

Returning early from the failure site instead would be smaller, but it would
skip nci_data_exchange_complete() in initiator mode and leave a pending data
exchange uncompleted, so the test belongs in the target-mode branch.

The patch follows in this thread.  Checkpatch is clean.


7. What was and was not checked

Checked: the fault reproduces on net.git main under KASAN; the patched
kernel is clean on the same reproducer; nci_data_exchange_complete() handles
a NULL skb on every path (verified by reading it, not by inference);
ordinary NCI fragment reassembly still delivers with the patch applied;
net/nfc/nci/data.c is byte-identical between 7.3.1 and af6737b90668.

Not checked: real hardware; an over-the-air peer.  We also did not audit the
other callers of nfc_tm_data_received() (pn533, pn544, st21nfca, microread,
digital_dep) for the same pattern - they pass skbs they own, but we have not
tested them.

No Fixes: tag is given: the NULL assignment dates from the NCI reassembly
support and our clone of net.git does not reach that commit.  Happy to add
the exact tag if you would like one.

This was found by AI-driven fuzzing built on top of syzkaller; its analysis
was then checked by hand against the code and every claim above was
reproduced.

Kapil Vaswani
Piyus Kedia
