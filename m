Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388553;
	b=msWOXiS0MZSWg8Co5pb4WvDflwSed53AxvQQx1kQb1ERi4PUPd0mwij1amr4wF3/KS0P
	 19jagzSnpshP9fDVdKfmiC66VoJPk4WkrlM0fkOZgAopIFZOhp846kNgm0w+HtTT+iImu
	 49CGos625cdrv9+00KWg0VbKtujNpPNqx/VFEKAqaPIIbxtKXLyY/q0DA+mk3kHdyFBZM
	 IuZVvwMWVHCTglU1AGlorQuBEGRTR3XpOr4cPLF8gU1d+r8sMJzpu7swvFrA+NFtLjoe+
	 Zu3/EdpBtZo5SmitxxbB2dOG8qEtjn9F+X4r7YwB1CSXgNA6KxOIIQkWbykyfC+hlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=k1FWUPbFFF4TedlPxPeZbgHqqhA4GJh/MR+RPJTO25Q=;
	b=kkwsd6h2qtJoa2l/vcEikHO+qV0iNZmSh959B3bh5NcrT+31TkeBrD43iu7iDQvxfA5T
	 qvkC4ySG+TJZEPcr1IwI9JV8q9EmyPJtT/JeuCjxPAkr3ccmeLiN4FrXZouG9ZwOP+34c
	 fo9kokpRHNJGPkBV417KCqh0QiJ7MP7SnA2aihp7pQvtDNt8FbiGYGtQRwH/aMRHNoM3J
	 aTKcsvgOm5C3vJ7RWSPw8Vy5sFdnM1YLZK5p0Aq9m5+m0GUKHrbEhS+PQOmlxKmYXrcmK
	 epzbySnIXWn3Xcu2E8/IVIKh0ow7Csb8Lt6/C6JO9w21DNwFPJUmuBd7gQJluupOWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZ7NgLkd;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24717606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24717606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZ7NgLkd
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04b676219so12852885ad.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388552; x=1795993352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1FWUPbFFF4TedlPxPeZbgHqqhA4GJh/MR+RPJTO25Q=;
        b=TZ7NgLkdOKtTTPF4ve4h53XWhnSAoKbxp2rNzV4o+GxRijqzoIjpSvIgT792wuWJfX
         BB1w5bvGlRNAolvKNzHDoRGa5FvhpKCt1qikFte6bnw6uvy1hMeohMsKdZrRP5g3eE6p
         CScBZPobNr2bHW2ZRvpwu9kPt55ki6p1Azqgki1pT/NUn9uxo14gRp3GUDW5MSdAtcRP
         4mh7xwczjTC6HsUxLgOBgTc3cLrWOyvEFSqbhwOjAoc8FsixUr5PQACIKRCzDWWO5fUq
         MqWbNpEZz7raoWt7R0zDJHb4/hgeg03QcUCGCOC8Jd7AY5REuuXQtlzT13shTQiQmm2v
         hC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388552; x=1795993352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1FWUPbFFF4TedlPxPeZbgHqqhA4GJh/MR+RPJTO25Q=;
        b=ZhVvmrspd5Fuiow0s6kDzHmUY4Jk94U2tBhT7cJJiLHCJEZoqvWdUx0SyEcIhSVSFu
         AVSHsPTqwIu6yqD23EcMCpibu0tPXw8hL4aidNgI6HASRpyfLPDmY/infcTg9CuCQlO5
         9XM9WT6HNp0hnDd2MxE4nOTYlWZRD5It4vot/u9CO5xJegtzu2TLm0uCt/h2uR7HJpRG
         9F6cMsnd8E566vk9QXZqO9YTEe5sWiOGrRn80xvVuQj9LoFn0CHGGg+eRGPSY9whuzrd
         +lbxrya35J/XgA/V1P9O7cuSSpg4WlgwLdRWZCDhJPeBX0mRpPJY3DWjz0hyaMHtd1tS
         MYNg==
X-Gm-Message-State: APuU4Z/6B/+Gue0yWJAyEenpXpmvmUbEnW+khHL6kRl0PAGwinC1l3VE
	LUAOg+O0iDE+HKFfVppbAO7YwbEyANYUSGHn2hvqriL6AScSJvOTMGnitouHbgedO98=
X-Gm-Gg: AZFdTZeQlnemAqwMFOo98A3fF2KgW460acGpurZOMt4BbH/0tJLPE4IEbc+9NoiCxt5
	3lASrOHtDn26KvxAdDJgXtTIFEzrmpigjgc07CIGMbKJC5//fu0UYmWT6Kh+R51Bn9jfjfBoWKc
	OWk2gQBQuRQWfA8TRnJwgAG6yS93DG9Zg1y8apLE+ELWE+l3c7xZzUrYfYGP6Iz9a87XTDS5ucf
	7WuWNRh3ZM1NrkjwCOP3aUJLelggSBBuirjhvYuV/er9ATjqRl3z5cNrIKLwyi352BsGMO4PYMT
	ULBduGb4Yqbh8ypd2VA851FlkoBAxg5sFJid9osSooaIcT0vbIh8spEJDurGsblK3G6BDs3xGXE
	KOVFfiyhMCDvSZ584r/OEg2/fgBOYNt0ROWUkoG+q8UF/7qZckTraCTq5t8oO4SEWybfyI8gwd6
	t+/bfWyZXELUv+hOgbTaMuWHUn2uPlLESQkjuigec0bB8Gy0xjFsnYPoc3+HGPXvSg/h6HkrPgk
	hxh4yb8Y2DvhSkx5a4gQy3jVzhGdApXUEczBz+1DvaDtQ5PZCSRxknE/cWH0Gt90++LoaJh1QZ9
	grZt7CdJojFleMohK9oSzD1g7sZPLG/zv/mHBG+SSNQHP2Snfo3iAt2eR/vqUDERnlw=
X-Received: by 2002:a17:90b:5109:b0:3b4:1621:ba5d with SMTP id 98e67ed59e1d1-3b41c95afa2mr9167746a91.38.1795388552237;
        Sun, 22 Nov 2026 15:02:32 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm17663215a91.15.2026.11.22.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:02:31 -0800 (PST)
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
Subject: [PATCH net-next v2 0/2] net: hix5hd2_gmac: support fixed-link
Date: Mon, 23 Nov 2026 07:01:29 +0800
Message-ID: <20261122230134.3366017-1-mmyangfl@gmail.com>
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

David Yang (2):
  dt-bindings: net: hisilicon,hisi-gmac-v1: allow fixed-link and mdio
    child
  net: hix5hd2_gmac: support fixed-link and mdio child

 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 15 +++-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 78 +++++++++++++------
 2 files changed, 67 insertions(+), 26 deletions(-)

-- 
2.53.0

