Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952464;
	b=BiWLAWyb7q3djcsiPoXMpM8QiKx52Jn3PfDmLhzk8QtBGsCJHQq8Nzjg/TWZdEAimf7A
	 R6IXiy4zoPiMx+yeTuleSgrwTpB7SjSXdwOsMl35mllkcVf5NpDBAcXAb/4+Lv3JyCXm4
	 yp0SmnXiNtezDr/Shkevg7oLBsq5ag+IX/sW1m83QSLEImisgWcImFuEOSPaqmGTHKHDO
	 w9ExwrDKtImM2fyYHosP7unnJ4DNTCp2Kjp8gHJW/ajwtzzq69uZgr0ZPljeoTlHYVMAp
	 8gmeOVZejk4hcGaBFAGONY3QMc1xQrizaEHHMz4/pTubPQpB8Bo4y9Edxjz7RkxkXFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
	b=Y3lKV7UYxJxoLfqGmFsRIRhhzDMvUs0UrwPd7yrcZl/dtY/aPksGhV1XGmNILmdwS0TW
	 KbHE+z4AggP040qwwAHQWW4+Gf5efLsXrBS/9ZwFoWbKw/en7K/7Qm8mwDBlzmWqDcWB+
	 zN64m4AFejwTyg7GYJnO76JphU/Hi44SyfONmVy8lAMr9dsDhwckoWeCsP+vO1jVoGyZu
	 q8hgGXGvVhP2Fg26TVMRzEE3zHZvOxQk6KlfPjiFaiIgwGvXjVQHx+xdR5ow1p9CgeKgJ
	 rf9p+w+Yp4whbmmswW6SeD4ZUT5hq27zfdgQkmXq6u+qyEefLYxc0p1ALB3/Qoa39+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhX7Jcov;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8C3606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8C3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhX7Jcov
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so109045a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952463; x=1795557263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
        b=VhX7JcovyKmxrvgpIB50VgtnRKLOxpSCZaUD5vEX1j+ZH0rclqvrXKsgxWfxAQ0LYO
         jk9amyl+pksRr8fdhxOy8ejm8VaYDnwCogkH7TiAedxD1aVxwD0hmzEJQsD8E95LjcJW
         xb+eDL9hMkYYxlNZj4tCv7bjEEO/XFWV6iaQT4TxY9l2e6edpzujiXq3MBjkTHh7gmqY
         V6dNwKUYuPbarpG+jSEgod5QpdciWNgttrw4dfa6qS6mYhft6pBs2rPw5GgEnMQuTco2
         Vgita1KfYEyDGdqpkbjf4GMnvaC2h6e/81WNYUz0rXXORVFl1MaPSy3iRflFkwR/FCIZ
         BscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952463; x=1795557263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQxaNsOwz4D2HUUy1GPmObRm9Acepun3MfHPQ7DCyEA=;
        b=XEQTbPPtdTzLhsnNWVcMIYkJzk1+sHNTL4ILWYA5hthZOooJarpWbIMRPPXJ7967hW
         su8p39eeia8N1Day7nIuVkAnVwmT9ZudpEjAjESdPMgaPq2EZc6mNvUEEtXn+iNcZQw/
         huy+qeJwSeV+1pNTteNonshlll9n9UGLCFjg9GcRFthF1M4QwgYaOrfoJj9w36Dz+QYV
         NZARfqZyKfUCLxsbn40/vh8iN98rYK4xPXXevO29MnrdNSK1hnMLHsA+PAm43hOFSyCg
         Ij/IWgzA0ywxhtYEbfBeAO2nR65XfkHoKKtiV6mJ1DXZpInstYTnRwQDqwumOVgAImwY
         MDNA==
X-Forwarded-Encrypted: i=1; AL+hErGaC8gpPZFbxc3BWD7AaOf01AKjGnHlcVVdqjPfw/VSgqJh3n06MznJraj0S9vys0Ww2moVhq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+2FAQ9IRTAQAmRTGOmq/xnep2srHWNR2gDHxstvr8jY8baiAA
	zTCIgwRuDhzK8QRTtqsSggkPc0+WilttOC8kf/cpABjegyNp0S/R3Eu9
X-Gm-Gg: AZFdTZf7o3ZbOBsYRA/2bfyxIrJdS+V0AJF/yG1vJcjD4IbwBy6iXWSAYN5AsmW+vnp
	fujG9KxfYo6Hwv5+eJFnkyvHdN0MnwNdelwMDlT0feXWGYu7IEmneiZge4J/VOuxadA2OAR+NFG
	tIAMMVRrRgEhPGI4PxeDa6G8IjTovhh/sLNFP0BEfmvxtmzQ/u02nQOuBQw1TKYsLbDoARfOLNE
	4ul5J6KORxNEuAjq+olVCTWXFlqesw+9vqzFRiYFnbr0TgUqoaKZVFB3NvfaDK6GjXHmQcG2WLj
	V7FRrUcRx4uTcrzaDJFoB88t3N0hXqaEtlTsCQlS/xB2d4DvNadcJYYwcWcgvD6MX6KvCYD4bFr
	mpnkDFDgNxJRHAH+00U0SZMAdm50uCLRQHsJCQow59RjNng9tujByOLoHKLAc4viLjaGhViNm2M
	vTKGmgXV5cafoFQOvTsXSssueC3Lyc9nzvoRWyUnIFE3e37oHw/lPQcOBK+32z8BPCJJ67Dlb2n
	d3JhG8LumotYeHTKYCedyC2yXqE759UgxPyfcgha+T8diIu/XdL5hzqPdKq0hX9pRPiO4/dS7i0
	l+78Y9/ZaosrENOMyFKg/GjK4JEj0tLHXTA=
X-Received: by 2002:a17:90b:4acb:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b3d07b08a8mr748364a91.48.1794952463115;
        Tue, 17 Nov 2026 13:54:23 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:3::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c4bea17sm91996a12.28.2026.11.17.13.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:21 -0800 (PST)
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
Subject: [PATCH net v2 2/5] eth: fbnic: skip disabled Tx rings when setting the queue NAPI
Date: Tue, 17 Nov 2026 13:54:13 -0800
Message-ID: <20261117215416.1901246-3-dimitri.daskalakis1@gmail.com>
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

When Rx and Tx channels are not combined, each Rx vector gets a Tx
triad whose sub0 is disabled with a q_idx of 0. fbnic_set_netif_napi()
and fbnic_reset_netif_napi() don't skip it, so every Rx vector
associates Tx queue 0 with its own NAPI, and the netlink queue info
reports the wrong NAPI for Tx queue 0.

This bug was found by AI and verified on HW.

Reproduced with "ethtool -L eth0 combined 0 rx 34 tx 34", and reading
the NAPI IDs with "ynl --family netdev --dump queue-get":

  before: tx 0 napi-id 580, tx 1 napi-id 514, rx 33 napi-id 580
                       ^^^ rx 33's NAPI, not vector 0's
  after:  tx 0 napi-id 513, tx 1 napi-id 514, rx 33 napi-id 580

Fixes: cf4facfb132a ("eth: fbnic: Add support for XDP queues")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 5efed21e5932..89e7b806363b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -2184,6 +2184,9 @@ static void fbnic_set_netif_napi(struct fbnic_napi_vector *nv)
 	for (i = 0; i < nv->txt_count; i++) {
 		struct fbnic_q_triad *qt = &nv->qt[i];
 
+		if (qt->sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
+
 		netif_queue_set_napi(nv->napi.dev, qt->sub0.q_idx,
 				     NETDEV_QUEUE_TYPE_TX, &nv->napi);
 	}
@@ -2205,6 +2208,9 @@ static void fbnic_reset_netif_napi(struct fbnic_napi_vector *nv)
 	for (i = 0; i < nv->txt_count; i++) {
 		struct fbnic_q_triad *qt = &nv->qt[i];
 
+		if (qt->sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
+
 		netif_queue_set_napi(nv->napi.dev, qt->sub0.q_idx,
 				     NETDEV_QUEUE_TYPE_TX, NULL);
 	}
-- 
2.52.1

