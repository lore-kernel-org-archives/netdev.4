Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479911;
	b=vQWasH6gEmPhS2twiLep5Svc3NHUCeu7IAdCfOc0P4HAnStewWJNuDdr6NxGB39dRIsG
	 GvHelZ+kyX01Go9hu5b0xmUK7twYVt+kTYL6axt5sBYCQlPwHzARUDT3lX5CnSgqd8PPz
	 Qu3tqEMnb9WcHXt15jVP3zCdhXH2HoLydxHx7cfqIv+FuJlYraGl/YB/k0iqweB0vCltc
	 r90X/3YTwT/jOAjcjRKXsAU/MxTxqYQScb05uwXIqugK+1E8D8kWXfCLoTyh0p5wWEm5c
	 s64q+6kYrmiGmlPuj5bWovgl7uXAU05Re1KvRWs99UktOLM4eNfAzAe50awuYiEqA3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sYVtY/mNfrBHVTrZb6p0/dzINpFnfub9SfAPa9n7RIk=;
	b=TC6GNXLP9HtsgoruWaagUGt1g3X72SfkB7H7xu8UK2dnxUMRS3Tld2k2VGLRyY7FIHsi
	 5mRczuW+dZsKQxQC1fcvk0Jx7RoYXKhsANbSAys8HCIaUQ4VhOSiiCZR0URYUiFrJZuG/
	 4LBuHqrpW8HFWZjfE0IrG6wBtf4uX4eeceCN4xxkDZmEQaROC1figxtSlPdeqyharCoXq
	 a3vD3O84sIfriGEZSBueY+eSioDjFR0CbK6NBHKh+s14dkjKxHlHe5J34S2E75htCafAR
	 dKNWP0vQMve+XLDCt2niZVsfl37GaVATS282I4ZDjDU44N1TgUdeDgodfgUXf6svKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxhE1PHD;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC05606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC05606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxhE1PHD
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so2082501a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479910; x=1796084710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYVtY/mNfrBHVTrZb6p0/dzINpFnfub9SfAPa9n7RIk=;
        b=LxhE1PHDFlPoJZhxx6mwPz0TasRmOeFKh1w1j05Qp6u+iF9ZNey8Lyg6PmFG0RQq2a
         SxgznmYMgm1r18vmCLJRFRs7VpZUi1Nr+QePv0wdV+y0pSx1SDxBnyC/X44NoKHl6qEO
         miI0ZRnGnf0aw6OajznSaEdb83Llg3WbRFjUTRHD5fZsc/TCPM83lxyVGagRAc+kffrq
         ydXgTBqVyvmz9cZwo1wxYOAIvNsCi7mX8XYqi93+snhYitRhVqZl+Xly1PoX5nmntxZ6
         b9W8YVjhL34Il0nItfMi5CXM+vGFoMytNUoaZWyvr7nxpQn6+5I1BfeLBD577IBmD9UE
         OCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479910; x=1796084710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYVtY/mNfrBHVTrZb6p0/dzINpFnfub9SfAPa9n7RIk=;
        b=nnh4ajvK3kgrN++XgxrrDVFzut5F85gPAYl2yqHxNf9P0x5B/86nZV6spt+LF3KU3+
         g5ARvniSijPbz5kJcRnglGC4q/t9KnLrAONGw24NmtGXV4U71VRHvDBIHxWkqf+lDdlY
         CLvkG0ws9zEI2qq3sZ7Dd5s/OR0RLgBJzxXK5k1qU6U9v6VvmAFpjszvKQSUIDS9M2JZ
         8kyaMWirnZxbz0pYPjD9a9goTi863qlxH3QVv2gl+N4upRBKjPmeP9cvFekAEAkDcXYT
         rVDyHk//ZjK3GtJf7wvFa6n7Myku7fp3GY81Nc92cC4dsHOQJDvJuvdhrcqzIST0hZWd
         Ewqg==
X-Gm-Message-State: APuU4Z9NlhqkKSZBAKPsmtn3WQy/3vYFVp0JD3U6q2s/cMNkYL2wJAoH
	10U0RJ0L2ewr6PfwlE49Y1lgPibyju+y7G6UjKoKKlOYSJYI7ONwFhb7278G0X6rbkY=
X-Gm-Gg: AZFdTZd2Vhw25xApMbSKUViXr12/QkjR+nZiX8Ef3HMntap9ecmYKeoQWooDlSSnuKz
	6/otlJ8vFGMsMBdUdDNEJYOqoykel6DfJ+bbm/F4MvvFlasj2eKToxT2tSQCxQgH5NRGsX07JZC
	udTl1z4AamLbPPA8GUsCBlwpKUTECj5X9rynjFliP76OhLTjEt2i+IeSyOHmZT7dQ9h5DJ6jPRS
	Y6W+lge1gajeStU6+M1NjMgAErtHnckZMeH8ihNaVE7ncZg/Ru0Li7H1Wi00D7hw2enDXbjuF70
	af/9V/9b0NCRSEckIuBGEC5q5VOMvCDZEttrYiH8Gozs6yLSMJAR4YYL/6zy4ucP/ctxwio7NhZ
	2+9lS4cSk7MpZeQ/hqFuOlkVP2NgA9aTDnv9UalN3K3tFjH//WBYaJey9zM5Xz0ftwGDT0bG3Xg
	K3Ee4k0bF1tezRX1QtJ/lda7QZR/vluer0bP8lx8dl4zEMuT7UtbSmNeTYBxrR+sKM98l62NBZD
	Mtq70zjkz+Sp+lfqpy2ZvLQCCwemr64ihkaDH/dQXmX7hQbMHCwOQzHWGIksnr2HTa9SqP4cGVz
	IV2KZ8JaAvKUhxGx8d49YI2wfz1D04cBmc4fdvkQASZJuErICVnUQabGRsWmiszc1NQ=
X-Received: by 2002:a17:90b:4ec4:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b41c8fe148mr10203122a91.20.1795479909995;
        Mon, 23 Nov 2026 16:25:09 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:09 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v3 0/5] net: hix5hd2_gmac: Support fixed-link
Date: Tue, 24 Nov 2026 08:24:34 +0800
Message-ID: <20261124002442.19414-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Support MAC-to-MAC link on hix5hd2_gmac. Also add and support mdio child
node to suppress warnings when fixed linked, as in macb.

v3:
 - use devm_*
 - split mdio child node and fixed-link
v2: https://lore.kernel.org/r/20261122230134.3366017-1-mmyangfl@gmail.com
 - add mdio bus child node
v1: https://lore.kernel.org/r/20261120031026.1371052-1-mmyangfl@gmail.com

David Yang (5):
  net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus
  dt-bindings: net: hisilicon,hisi-gmac-v1: Add mdio bus child node
  net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
  dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link
  net: hix5hd2_gmac: Support fixed-link

 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 16 +++-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 83 +++++++++++--------
 2 files changed, 63 insertions(+), 36 deletions(-)

-- 
2.53.0

