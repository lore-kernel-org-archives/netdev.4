Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861001;
	b=ICcdk4MTbornSCAkn03wORII4CPy5XJmXKihz+Vgqkv5vkbmD5ad2XCmCjQlWBdkRvLg
	 kpicf35pqHG6jeT0P2HVS/HV/Fmqk2VxIzA5KpZTB8WiMwv9yaAb3SXMHsCHjDrH099S1
	 Ez/lZjoIVhQe/5akk6KTWcg37lyHLhcQKa7VaH8Ji4zV+m/Tc5u2SfYJ+F1czDOGi1Vc0
	 gLqVo4+rPTfXZEPfZWZQG9PkONtUDd0hJ/TZSt4wQk+VUK1U+WZbEh5/Uxchc8v2SOI4V
	 rKOnkkRh66rCI7Rkk3+sydz/WiHzG9VNXb35yEY2Gh1Py5hqKDNziVQA+wiZ51pKxnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2f/N1iHP1pXT5129wLrY1E3KZ4LFFJ5GefYVFID4tTA=;
	b=iRbPO1mS4GSpT4tT2Kyefycsq+qivoHidiRPmhojAgVL3/1scCyecYky80gPkA6ByPWJ
	 8B76S+knm4xUXEFAH4GmWUxYLkDxkR1xji3WsrzBzqzhbIVqRUIF+eYt5XqB2kLJLbIOK
	 bMWlVt/X1jnt11SW1yg5qKLqpyet5eeFdFAQSoLSejPg+dzLRPsy4kXyAGWbYZXgII8Ns
	 FyFHvMeWE1OVLtc4TiEU/pgYfLWdy9NCVutGEuSYt06oxLNhgUuUoL7JEi66svc5iME3C
	 5I2GL+WWn+x/MtAfmt8fwGM8gTZcH/MSeZWHjSU73bS4mEgPbrM/LiD9iHIZWBv0EnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsXcx7Tw;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEA6606A8A4
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEA6606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsXcx7Tw
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1618314a12.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861000; x=1795465800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2f/N1iHP1pXT5129wLrY1E3KZ4LFFJ5GefYVFID4tTA=;
        b=AsXcx7TwNvgkNtemn6++gEW3idP9ABIeX3jLWlDNZRNN6vQoDNktV/SFye8cGAFAWr
         idpbLEJJ1qlLX3euVbOT65VHlnhvBNRqVo7Tc35bJwJ5WlaYqha21DNqTgk9bSuB4EN/
         MJnYmaiZEWwUjHyx0QNnmnVWgSZDvUSBH8Yu7ChfQEj8OlCe0WmEpA7IWlA8UUUkhDiX
         LBKD9HxQQwPHH9CKJdkU+YyxHMeMyGbvd647UR6EDociDJF4HHQnBxyPPUVpZ61prwc+
         Rh9iJ58PjabhceAplYRhEZefgQNxGZHnEXwByRpadkGfotFZaI903AtTdjPkTbYl6Pb1
         u/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861000; x=1795465800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2f/N1iHP1pXT5129wLrY1E3KZ4LFFJ5GefYVFID4tTA=;
        b=BaVQFsXzLnppqaa1iqSy0wpkKCJdGhhBbhV/5H63xWG/KV066/nGBzqYv/XNhiAJyV
         mM/85rqUajU7YcM/7mlGdIrqu/+uQHDFo1FH1uCHblGImK/O6SVG1oAluryk+0mPS2Ow
         9P3D81y8SlSi3ieIUTEoM6nzlDrj8j+iif/8c9Ud7Tx9jRlrfODd7LiM/mha/ltU2YLF
         AtjeFJuNer9FL/VFDOdkudyKRoY0Pitxe5gAzhBB+lazMahpvfPiSmi7vy4HJWsp/kDS
         4z4Ce9yK/bBCnBkYx7aVgTVL/ZJITlFv+3sRYHLUWuELwUoQmlpq49YxDl/SQUbjbhIf
         xPlw==
X-Forwarded-Encrypted: i=1; AL+hErF2bwP5I0+ErFiBikdjMUpLblqZMzKVlFO31Sj37NRd1BGSt4WSdX4BKjjcLmscBvRPl+WzbbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BssF46C/ztZ+ZY8Nm9HBKR8mx/T0bMoBxGNLQyPPMYEjpaeNA
	ihsZ5wE+tKQD8QEyOgBI5a/cbm/B4RV2KT+iknCsMsr0WMI2QDVpVIhS
X-Gm-Gg: AZFdTZcVzq5+APX7kNttWvubCf3wB1R8nVn2jH5VwNVaJaU2qQ221TjT7qtu0D7xBuV
	RhJ6He3s38Jjk2ap2v2fb9wFn3T3V2dEmEsZFSlxeslM2r4D9DJlj/MCORshZxO9zsUUQXbEuMA
	OJ61hK2VbspqOGNU25/1oDEAXtMg3PZBzbUwsvDME/zr9rt/RF6uiDrTErxOsdMAvgPNCOViVFd
	2rF1TlIYJMYOgYPv+4IVJ2izrH/qitSba6JlkhCBOq8/Z3p745AOTsFCY8tDoZmmRe/bsxkYKWV
	Z7oTlMThI9bXRZFuGx/l49t0u4+/e8JM6B81Hrjpl24XuoB7hn6tAFZFGnhNYrjSGTu+Y0tVrcI
	RgZeFS7EwaYuxehrarc9dsi6EwalUI+j+UEg7IzStiK586TCb5fX4N9sIH2MOOJkxgVAhI6LSu6
	VYI86Egpv6dmfsTF0v1Gum5NuHNQguzgHYeyTAavFO3N2hp9rneH0RYoKviDFH9hZji5y8BK9Y1
	qGFUVv/hQKwkU46sK7UiR7CrS1x87vUD3l86RLnLvoza1Rq6H24fzSNm4hyAE1DAbk4Jkl7UfPT
	pAL0RqXCEUSnVlFFDRwB0QuV0W4XA9tWdViWh9oImhCmnBJ3gwNajQBR
X-Received: by 2002:a17:90b:5687:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b1b0a407d6mr11173613a91.17.1794860999890;
        Mon, 16 Nov 2026 12:29:59 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:5c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm630428a91.17.2026.11.16.12.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:29:59 -0800 (PST)
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
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 1/4] eth: fbnic: wait on the correct queues in fbnic_queue_stop()
Date: Mon, 16 Nov 2026 12:29:54 -0800
Message-ID: <20261116202957.3601684-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
References: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
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
      fbnic_wait_queue_idle(rx, 0) <- wrong rxq
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
       rxq's alaways get a XDP Tx queue during init)

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

