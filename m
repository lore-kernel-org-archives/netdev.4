Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438160;
	b=2A3VDm8r2S9lheH5fTs2MxgD7hPEurpUqQt60G9Jbft1uhBp1M9O/5P0OuXSiyIohoZ8
	 n0Htk4tgjOkmOsPKw4nzxhFXo2EJTRonrqWVF2dogo5T9ujDi4aBDIudC/XamvyjBe0Dv
	 zQPurReumrrz23Tr4YEMcXT5hDJBpFwvZaDRB4+BXPZIrdeqhvlyqM7bM3UPl0Q+TAXF7
	 8PjlXzuiNDJbmWo2zb1gbz6wk7vr2VQMrJCfb7jCjMZw6Vi6Bt7t1ridyeeQprPWxXFLL
	 JcYTmOTmyG636mjLFAbdp0YxKtwTivReXFp9Zf2eFBXHoYy88uRYfcGoezcI9iOJ0HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bferII2lyA/H1hIC/5y/64FdLoV9XxlRkIiuA63uNpY=;
	b=ZHaL5LZUo15FKaX1ivsm8KaB9FNiKnsHagEuDvJJNjNhn4ucYTue/nOZNW1cjI0tT/5D
	 uU0sJyYLcBBb4aa8vhUsxhS/9FPZyk03CwkdK8ue3liSOJLTJ/p9ohvvtD9qsRUJxr+0E
	 EA1aVZy/0HRHxw6eAPtPBaEFV3t4GlUYrWWpeHjURxWu6pKxMyqGiJiJOMBxfxjor+Sif
	 GZfmG0UTKJ4C5ABU46zuq4kvJ4/CDvZRLxZidakAHS1pwjga3iXcPoDVVek0VHH6favoJ
	 DRayqJDPVqah3AwTnsaeSSNG8M7LW9zGPuQaiDIBcifVQSOvsL2RoxgfQySs0FxtJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G0nVqK/2";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B7606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813B7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G0nVqK/2
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so29718705e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438159; x=1796042959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bferII2lyA/H1hIC/5y/64FdLoV9XxlRkIiuA63uNpY=;
        b=G0nVqK/2ApMbbi1v22uCMusPzgKZ6T7NzkA2JDYahvJcl5XsbXDnhqtOMQWHV1L2D3
         cl2c8HIlxLMLLorroXlD/cDj/oHbFa5NBG2jpfPzetQDYEYneB5V31pWBEpv5Tp/EGD4
         bzQKy/xpDsTJRo9uXfkUiY6Riqx5h5EagNFrW6LZW0AZDyp4m2CmNulNHnUWXEpQOuap
         DNk+H7ndNwxPaK07EJQS9YIoKTiwjcmQ+7y15YBJzxYfddeOTwTR/ZcZKuzzMOfK5uR4
         PznHTsPUAvR4ppyOh2vtzKhkSKSDDMbNi6Q0ZCBC4Q7Xf72fNMOqWPIGucqaEF0dTmOh
         vHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438159; x=1796042959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bferII2lyA/H1hIC/5y/64FdLoV9XxlRkIiuA63uNpY=;
        b=q5oBQ3TAfX0BB1gV/Hr+9GE+ELf6d8mobf+weIseu1sBinGS2oVmIiBBB2qC6QHnjp
         QdZwjA3OF/+vkNj7gMkon/mh+crwNtvVYSVggzEhkYIPVCwMAf8TBnW5Zt1Rx0Lwzs4D
         ermHQfq8NZW9DIglndQuG5TWmIrZmtLQwZrT54LYChAX1yAt0ctxxt9wqmWPaKAJFyLZ
         6TOKV9s0JlQPO3oMo91UyzBx8rhJIzkqIzyEMK/kADBy0O9iluSl7YgUgRdDoAmow0aY
         IAG/HjTuX7Nx0d+ExwxRtKmHjZ0XeE+QlmU2YYoyu0rU1Sr0dah0R0aRWl80SUs4TZuF
         yYPA==
X-Gm-Message-State: APuU4Z/B8T4xf/ibawOgfRRhSiZCsK65ke02pP/tTyiZWssh2hKPJeCn
	tFe1csledaEb3q1hS8YhA/O/36mUcPjJr1MqudrUgm1CXqh1m0lwdPFX
X-Gm-Gg: AZFdTZe5DGcNudhgor1BV6Tw5pNN7RZs3uBmPFZ/82SyvLgdHJ5zXnGlJZYL6PFR5SN
	fq9yQwxq8IROsHxpwS2zRFw/j2ZrbL5AOFIvC3J6KOjSchfEuIx9g3uPJ7Pdb1y4EKjf+191ei3
	VWOSs0e7s9o8aJM87pZY/5g5oLSMbuRgZWSS8eve1dWUflfnfndRddOXfnTzgFZmSRgfn2wunT0
	M130rFdbhHp1C8AA7XGfTcx8IA7+JxY5dwYD/EVJM1hRu8fGO4tjSgUqwAr/dphgAWjCFzR/zDa
	GKLWsyfBIKx5LrG5xJiCcBLPbH6I10mVijMIWx11+RNSX9xPtZJgW8VWmTwaq5ih0dlZAW476FW
	pf3eeNcgQx5bnn7MyF+qfDMciKWOzo2FKaZcCiGaoDTFoFgPKUEXoNijv0TTxMdTYFBXkkdF19K
	gI1gZBb/bsON3LGti0DrNr454df1QFk3RdefG4jBT48Nxav3fDbL6WUXBUX+kzF4pn70QMJ8Te4
	jX+h1NXz2Kx8pTjJkMPThvaG7dWjqY7SMWpSbeTqYi4BA33jBKlIrpM9R+J1R7SssL2GwRFfr0W
	qSBS4IG4lI+SnajPkCgYU5Jo6JlENcLqTpiqpdw=
X-Received: by 2002:a05:600c:4e0e:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb88938dc9mr245624855e9.31.1795438158755;
        Mon, 23 Nov 2026 04:49:18 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm165097045e9.5.2026.11.23.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:18 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: ronak.doshi@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	u9012063@gmail.com,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net v2 5/5] vmxnet3: keep the XDP program across device resets
Date: Mon, 23 Nov 2026 15:48:55 +0300
Message-ID: <20261123124855.1021-6-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261123124855.1021-1-filzador@gmail.com>
References: <20261123124855.1021-1-filzador@gmail.com>
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

vmxnet3_rq_cleanup_all() clears adapter->xdp_bpf_prog. It is called
from vmxnet3_quiesce_dev(), so on every MTU change, down/up, ring
resize, reset work and resume. After that the driver no longer runs
XDP, while the core still reports the program as attached, and the
driver's reference to the program is never dropped: a later detach
finds xdp_bpf_prog already NULL and returns early.

Seen on 6.12.117 and 7.2.12: after "ip link set dev X mtu 1400",
"ip link set dev X down; ip link set dev X up" or
"ethtool -G X rx 512", the attached program is no longer called, and
each detached program stays loaded.

Do not clear the pointer there. The program is exchanged and released
by vmxnet3_xdp_set(), which also runs when the device is unregistered,
and which since an earlier patch of this series keeps the previous
program on failure. Rx rings are then recreated in XDP mode after a
reset, as vmxnet3_xdp_enabled() stays true.

Since the program now survives an MTU change, reject an MTU above
VMXNET3_XDP_MAX_MTU while XDP is attached, as vmxnet3_xdp_set()
already refuses to attach a program at such an MTU.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reproduced and tested on the
reporter's lab systems as described in the cover letter.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index 66f6773..22367b8 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -2107,7 +2107,6 @@ vmxnet3_rq_cleanup_all(struct vmxnet3_adapter *adapter)
 
 	for (i = 0; i < adapter->num_rx_queues; i++)
 		vmxnet3_rq_cleanup(&adapter->rx_queue[i], adapter);
-	rcu_assign_pointer(adapter->xdp_bpf_prog, NULL);
 }
 
 
@@ -3666,6 +3665,11 @@ vmxnet3_change_mtu(struct net_device *netdev, int new_mtu)
 	struct vmxnet3_adapter *adapter = netdev_priv(netdev);
 	int err = 0;
 
+	if (vmxnet3_xdp_enabled(adapter) && new_mtu > VMXNET3_XDP_MAX_MTU) {
+		netdev_err(netdev, "MTU %d too large for XDP\n", new_mtu);
+		return -EINVAL;
+	}
+
 	/*
 	 * Reset_work may be in the middle of resetting the device, wait for its
 	 * completion.
-- 
2.47.3

