Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952461;
	b=aaNjOxUaaofnm4aGAsb7kkzWxLsQDy51cfKrMIVpAvPvRXgdbj2YU31fsXHELp0kNFcO
	 aIAGufdCO5REbaHa9WwuDpZgg5yVPCxkDg24Jg+k2UmwxkGf6CrK4zUfQoABBcQJnUbFZ
	 LAHtE44ldxbZc27u4LOXqKQPmaf6jlGcBrMBgOVpFTmJwcPjqSY7fikNhDdVX2P/8gx6J
	 QVUcC+nFKdWUf/jovPkqi3O/Vy/iJ6Zft0q0LHS/raMT22vSDjWzFoC1bJA2R94tXpwzw
	 l6NLeUm5gO6yrUw/EnznmyrKAz8GW9IZr0wPlvH885YbFuzmGoJMZA5qIkmDpvezzLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8bB5b1dVANHFI9CUE+jOVpzaE3fUb8dk6NW9fqF85O8=;
	b=g9zuKtlrq2K0KwroT5Y/G8RC+br5aPnBXPrVoBy7E/BaEde0Ji7Q0p+k3PGokBK6IuQ0
	 UEqXfH3JoOunPNsaG/kFdEtyqHeP4ntmgkZEy5XxRMSNKU/wM6x9D9Vs+wMenCXIN2OxR
	 mZq8AkX4MkFPij6Lw7X6mAn1ie+RYXPlEp+9twjXflytpQQGEUJvrn5C4MynePHJ7JR1R
	 hiOi6WFda4nFmHNqkPq2efvGfEfKRSBaHjODvSQrbxsKgshRjq016Po8p+CfwFCXF0wAP
	 +2SHsxpJe/ghYp1lYKJ1d4SHDhAQhjNBKaawsk3xNbMLelD7HiJVLrXG/sHl28Gf4MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EngG3o59;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA5A606A337
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA5A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EngG3o59
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so159508a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952460; x=1795557260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bB5b1dVANHFI9CUE+jOVpzaE3fUb8dk6NW9fqF85O8=;
        b=EngG3o59wsEORWZNDZq6YsECulQhNEFJhHotm5bNd2cBz9+OO5TKydxKiwnMJ1/Djv
         rxsDPsWK9FNe2y6CufTPr0gwrMYrA+rSEu4aTJ4p4cV5/hD+YfQhsg3joUNnq/a+CINP
         soTsqr6kQ/gH9bILc9C//cxuDpO5g7CoN9HPZmbKGlKjUtdOztqc8Z4YpwhGfBNhSBRv
         M+u0fBJvRRhjkjjSQVcsPgRKVi6e7N471L25KC3upPS/d7uCZ11iwJUeajfnOvqQfYB0
         t1imIbQGKrNYKdd2xOsmv2XTLkrprXDdknuhwVUcujcQObK5O8bp/6VCnOnY/JpWvQo+
         b6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952460; x=1795557260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bB5b1dVANHFI9CUE+jOVpzaE3fUb8dk6NW9fqF85O8=;
        b=nZwbNLgEfrcQ/tuzr8ElSvwLFUqN4Req4YeTkkdkhqaBvztohqf6IdQ7tlXcsl8i35
         gnAH25ROBg/U0QpKnibAzMHgdAOgZRf1xYaEwsvzOHCPbvsK1VlSfBnUCI8sSsfSs6ZB
         sck+VyHZqR2VLMMuGf+m1hB8ChrtlYWyrOEu5Rw0ag6+lUQdqQ5chWm+ZhTZ3sS8V3rH
         krf02zTt9NO6sZ0g5c3v4mNcw6v5dZZqGFcHVnaE7LhFFnoLVqGOdWAsAsAyhx9Ve5hy
         WVNekxkNS90gN//yKxp1dqMNhd+BS2jJ8RVCHdVQRv1NmlF0FAWIxy4YnfP4wDCCR/vQ
         FeOg==
X-Forwarded-Encrypted: i=1; AL+hErFIDz9qvCSCtZYh4NrW3b5FbV5nGWE+tHUjDJDiMOSwIcl5JOIu+h2r+vepVw5xV7tt13HKskU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rTHLSoMdPCZc1vz9Pi/hJdqkVkawvmEcRmAHBu5fSmPM253WQ
	7ecRU7OeVva7G5phRfHvZILMYhEHghKHg87BZCLHKqxBZnEFY6eew727
X-Gm-Gg: AZFdTZfjdM1OtmRCTQmRt6DoHmqmGeueK5FRPE0ZjEEwi2foI57LifpTqcyJ2e8kZGf
	abAR3ap6iYEm6v+C1ZMKSj3Z7fqA6Rcgxvili9Olw8o1utNDDbxXsv5lZS4hpBQLdYQMFS0hviR
	GxoPytTnsPOupU/g6BoXmrMgIBf802SIJtM/TOfjEVkSJlSNxZixAKOoBIrHs0mkd1fg0pxTWCP
	BdRXthH1vhh3Sy8BlbUTcIc7nqTSnFdQAmdh+Qf4woX/G0+c9G6zpAunG2I0sHka6+7AGcbjNgE
	1o+ry/rklSi0zkMFNSPWvpMpgR+TyjgSR1Rfx5ltgMP7pKl2QSYcIe5vNDChmvyHIdgzEokPAyj
	BZjgH1G5rZ0DrtYShsmKyRxtasYZRyVY+dVard4FYy+iyw6T41oInyJJKdcY4y2fq0OE9ctmtsz
	G++46lb/iTWM1FQki4M5wzWVCa0Bbf2G3qS0SeXUk0hhrznJJt9aoZihyzu0Yuqh1Vdc4tOQsHI
	0opmgprSlN0wzMjmcmmEUF+KG7HurJ0ceeH6zqEbgALQe/ei7LrtwjNYnZLfvBpsguBc6kM8O05
	Mas2XhSA0kw1vCI299YxXSx/03db9y4fh6Q=
X-Received: by 2002:a17:90b:1649:b0:3b3:a9a4:8c9a with SMTP id 98e67ed59e1d1-3b3d064200emr728386a91.1.1794952459801;
        Tue, 17 Nov 2026 13:54:19 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:52::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b4ecdsm733695a91.7.2026.11.17.13.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:19 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 1/5] eth: fbnic: wait on the correct queues in fbnic_queue_stop()
Date: Tue, 17 Nov 2026 13:54:12 -0800
Message-ID: <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

fbnic_queue_stop() waits for every queue of the NAPI vector to go idle
before tearing it down, using sub0.q_idx as the queue index. We set
q_idx on submission queues for Tx, and completion queues on Rx, so
this waits on queue 0 for every Rx queue.

For non-combined channels, stopping an Rx queue always stops/wakes
Tx queue 0.

Set the queue id on Tx completion rings so we don't have to distinguish
between ring types to get the correct queue id, and don't stop/wake
disabled rings.

This bug was found by AI and verified on HW.

Reproduced by binding a devmem dmabuf to one Rx queue (netdev bind-rx).
Added a printk to fbnic_wait_queue_idle(), and traced Tx queue stop/wake
with bpftrace.

  combined 79, bind rxq 1:
    before:
      netif_stop_subqueue(1)
      fbnic_wait_queue_idle(tx, 1)
      fbnic_wait_queue_idle(rx, 0)
      netif_wake_subqueue(1)
    after:
      netif_stop_subqueue(1)
      fbnic_wait_queue_idle(tx, 1)
      fbnic_wait_queue_idle(rx, 1)
      netif_wake_subqueue(1)

  rx 34 tx 34, bind rxq 5:
    before:
      netif_stop_subqueue(0)
      fbnic_wait_queue_idle(tx, 0)
      fbnic_wait_queue_idle(rx, 0)
      netif_wake_subqueue(0)
    after:
      fbnic_wait_queue_idle(tx, 39)
      fbnic_wait_queue_idle(rx, 5)
                                ^ no more stop/wake of Tx queue 0
      (tx 39 is the XDP Tx queue of rxq 5's vector,
       Rx queues always get an XDP Tx queue)

Fixes: da43127a8edc ("eth: fbnic: support queue ops / zero-copy Rx")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 07d4b2e92362..5efed21e5932 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -1772,7 +1772,7 @@ static int fbnic_alloc_napi_vector(struct fbnic_dev *fbd, struct fbnic_net *fbn,
 
 		/* Configure Tx completion queue */
 		db = &uc_addr[FBNIC_QUEUE(txq_idx) + FBNIC_QUEUE_TCQ_HEAD];
-		fbnic_ring_init(&qt->cmpl, db, 0, 0);
+		fbnic_ring_init(&qt->cmpl, db, txq_idx, 0);
 
 		/* Update Tx queue index */
 		txt_count--;
@@ -3047,8 +3047,11 @@ static void __fbnic_nv_restart(struct fbnic_net *fbn,
 	fbnic_wr32(fbd, FBNIC_INTR_SET(nv->v_idx / 32), BIT(nv->v_idx % 32));
 	fbnic_wrfl(fbd);
 
-	for (i = 0; i < nv->txt_count; i++)
+	for (i = 0; i < nv->txt_count; i++) {
+		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
 		netif_wake_subqueue(fbn->netdev, nv->qt[i].sub0.q_idx);
+	}
 	fbnic_dbg_nv_init(nv);
 }
 
@@ -3089,13 +3092,16 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
 	napi_disable_locked(&nv->napi);
 	fbnic_nv_irq_disable(nv);
 
-	for (i = 0; i < nv->txt_count; i++)
+	for (i = 0; i < nv->txt_count; i++) {
+		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
 		netif_stop_subqueue(dev, nv->qt[i].sub0.q_idx);
+	}
 	fbnic_nv_disable(fbn, nv);
 
 	for (t = 0; t < nv->txt_count + nv->rxt_count; t++) {
 		err = fbnic_wait_queue_idle(fbn, t >= nv->txt_count,
-					    nv->qt[t].sub0.q_idx);
+					    nv->qt[t].cmpl.q_idx);
 		if (err)
 			goto err_restart;
 	}
-- 
2.52.1

