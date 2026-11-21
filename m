Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231946;
	b=obNJ1GJZ7XUDSyTIsVsPCzO1No6kktyDjWqUyGO2ydOmTsuY1DLvXXIq1f/TNqlWuhrb
	 2ycsMX4UKKR8Vn5WZCHRM49vaHQbO30Fa2GaszsYABy4Yhy4iLM+REAQk03FVw2W5opK7
	 sNdc47WH2QC7LSz6m2ygDueZBaroeZL6rOhIhaoK5TqfsD3VeTQyTOKwGgBvjQcdbZXNS
	 /Fk7WjRbyVFnQxbahu/yt5blR29S18h9ESImnfuiurBpEeYD1OFt7NcInOAtYYHJjT/Q6
	 30pA8zK0hjRa2Q2pNCbGcZczdN74F6ypotrdzd+u4NmN+lyChRHGTSDat+Ksfw0neKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wKyVEUcCtfCHn35kKG+OhBaUhVfqRDXWHj3fUWM2PnI=;
	b=bfhUuKvmHA6IXceSUggboWhTCrkIde/9fDxf6p4iafhxrSFVoGEIK5g7rCLAMtJ8qH6v
	 ot0wdyqtZOSxgr7cRt646G+OXQVYy0eveiPtpMWhftCiS1c05flySp922yqZH+PqtIV4u
	 dxpGSNXDxghrMvBOXtiRNGrKfFssCc7C5X1fLexDW7CROK7ULJb+o2v3bmigUXzIpR85s
	 byfw9+TdSZJHRUHnBMiBEpeB1ujEZ5vonzhplZn20wHvBgdDNFyBL0GCRsfnQNPBK/6GW
	 wWlpAa1aX3BGTkQoCXPQRgUmUAHEPivPOoAQUYnlQh8Il2zbp8Jo84lzoy7rySGsmWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTeJbitp;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D46C606A6BA
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 03:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D46C606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTeJbitp
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1402602a91.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795231944; x=1795836744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKyVEUcCtfCHn35kKG+OhBaUhVfqRDXWHj3fUWM2PnI=;
        b=eTeJbitpwjDs4hlSJDGTuttmkRUMF4tl1m5yGVibUkdr+sxETj5oPeJ125LWqEf2ib
         zTVY9tpEkuQXzZmLpnkn2WxMEtTEbm5pBX//mOdwTeQnV+fEXVZrRdLwP2EKZcNbAEiX
         s4qp4GNJjdRMDYAIfqCHm8bj8OTBdd+SZ1jw7ApuUdbvIsTqtkWsznSbVFGtCYVxMAgM
         wU0VrGdczPlBfY7CQmEAWMYKIZDvL1Fg+km/2hAd0V4h6RaZWYyynFG4k6DbCmYTuVqq
         mbqFbJvOyV0nX8ysRo8mB6voWU2JzQgY3lYgjUEd6G1mCRNfIAN3lyMCZccDnfC1KuyS
         8cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795231944; x=1795836744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKyVEUcCtfCHn35kKG+OhBaUhVfqRDXWHj3fUWM2PnI=;
        b=rEylKAWQub43iwBIREzvWP87z4hpRCZeoQV5BHLKvSGa8RVITpTIE6SHPsmyNnr27o
         xcBh4LJoIqm6ZFukqyjzmq8TY5XqKkwreR/1pziC+GH+Yw8KZkFQ3b6pZmPiJjvtnZ0U
         +sPxBlB2QjgPiMSWRGMEIAS8xM/0T05gulOL/NirpkD6JrIN3jQROTYVEpaAnc35MXi6
         pFFIZNDtS5MZpGzaE4F3O9ktpURea3pc2qJHtFf+vbmE1Cc/s6vt9GykPb9p9+3T2h6t
         Ketm3W/bpmn2bBWM4ObLasPpR19tzuHf7zdLddchcQBVx9Ba36BME1WTyBXeACHAQDSx
         hK+Q==
X-Forwarded-Encrypted: i=1; AL+hErEEBP6YpYgnWtS8AVI/DSAJp6lgE8svmslgcz1Qymm8IJ+SQJkdldtwW+GbXXKhnPGqKEZ60Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ztEuXZ3lErtZtYaZVaEuNe6YcTYmQw2IgEWCgG6AxiEb3vw4V
	xz84VG1DD5/WCSXnRLrT+xPi8QeO7d65Vyz3SkUrUAW4pZRIVtqgTuD1
X-Gm-Gg: AZFdTZfZn3CKnKo/wYMUtLGJvnUQGU/dbJrIVbjX9SZPUcEGG/RC2RwCOXjR13Qp8dH
	8ktE/KTF2SysRxxVEQ23AplpmYy+icY/ZbCPgKRB0av9qTxr2lcHDnn57Jbsib+Fn+iBla1w7f9
	LXgp466fOayb7tK0XAoiznCbCp3n4ZuNdCbdaW+mIouxIaDyy7/hhAslzoiCS7FzWasB8RUIaOe
	6wETsnDqLIBQTSk6e+quygm1DJ8syMo1kIjHavSWbeIvwuTeb+CaF+jUQt2RFaglBn6bsll3pxZ
	lUlmGlGNYpxZpMmb4u2LnoVY+dvKXWbcU/8TzCfjlzUw4jBGYfcQ4/FdahCptNb/FZRC+5wJ2Sp
	39CvOJDEy4pO7AB/uT5i0U1MuNtUP2d9qz1ag2Zgpki6icC6J072UlCEeFjJJV3ul5q1SQFx7Bw
	ePcuXXZvjgcV3XwsA3flqrFNSF5s5Xw7yZqGoMb9BKWNgAiIEpNyhzee2Gi7fiDwOAYTnb33ZJq
	5vdAu9ZsXgtvsLh3CeqoAXw+6jL9S/Ug6L5p6gdRF0kw7iE4QHS83Xexhp8IiHzqCF1rgEAXb66
	oC8PRio5OViQFkXb6Dtp3gZeNGEZW/WA9aY=
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr5490388a91.15.1795231943663;
        Fri, 20 Nov 2026 19:32:23 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:44::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm110062a12.27.2026.11.20.19.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:32:23 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Mina Almasry <almasrymina@google.com>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 3/4] eth: fbnic: wait for in-flight xmit in fbnic_queue_stop()
Date: Fri, 20 Nov 2026 19:32:14 -0800
Message-ID: <20261121033215.1020506-4-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
References: <20261121033215.1020506-1-dimitri.daskalakis1@gmail.com>
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

fbnic_queue_stop() stops the vector's Tx queues with netif_stop_subqueue(),
which only sets the stop bit. This races with senders who are already in
fbnic_xmit_frame().

Use the new netif_disable_subqueue() helper prevent freeing rings
while senders are still in xmit.

This bug was found by AI and verified on HW.

Forced by adding a 20ms delay in fbnic_tx_map() on Tx queue 5,
binding devmem to rxq 5 under traffic:
  before: BUG: kernel NULL pointer dereference, address: 000000000000002e
          RIP: 0010:fbnic_clean_twq0+0xa8/0x290
  after:  fbnic_queue_stop() waits for the in-flight xmit, no crash (10/10)

Fixes: da43127a8edc ("eth: fbnic: support queue ops / zero-copy Rx")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index c0fe89425430..62b67940c13e 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -3191,7 +3191,7 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
 	for (i = 0; i < nv->txt_count; i++) {
 		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
 			continue;
-		netif_stop_subqueue(dev, nv->qt[i].sub0.q_idx);
+		netif_disable_subqueue(dev, nv->qt[i].sub0.q_idx);
 	}
 	fbnic_nv_disable(fbn, nv);
 
-- 
2.52.1

