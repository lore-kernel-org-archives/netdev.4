Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654540;
	b=vOtjtJj+dQL1XJG6qjrEiNiiVgFW1e8Se+DhSyqcDSEZupEVkmta5dM0KBJw8z2pIIWc
	 3nfkAt2Wyw/K9T2V81d0Fhz8WEccIj89tIVu6gpIQqGsYdv0dIJR8hwtlhOnK1JiR2ppE
	 xiuM9Jn79i8UTARzGpcYBqPpiFd5U1Krvsu8gmi0vYcRwmHkX5J3lB5R3WZldZIKigoWV
	 fv134qMAd4OqRV4QyTFWgK7CJHDWv5QRxcMR54Ce7BurNQmqtm+18UvIyi3LLpZ18W7aD
	 jgNgPyQBiO0ovRjUcA6SFPjvSlEpz81NuYnsBJigbRg/4LPKksbLNLQJpYslcI+XaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KZdqz/5aN0a+Mnl2BFDx98pc2JPnx0esugp5NJKn2WQ=;
	b=iy013KhhgHWlmNGCN29vyDIqtjEfMtnZh+D2XtxgRcXeeu6VfwMIBX97lNG+CWLfAbLb
	 aOwEEsLkd6mBdNgTBUap8ee9YL2PCNSKlsuHb2MT37YAuTKKlJwEgFKFrbYwPNA8KaYoV
	 Y008gFfaRa3EMKVNtIga+rePw1CXaqMYSOsM+QxznSs0WL0LmnBt8+yfyRoMXDESy5NFN
	 vUPFGGRsRBqw2A+8NHC+YP96U5//0q5Uqw+IHBSO+zIFJ9aKdTM9yXNVKXvQLZsiBYv37
	 lF/FO7xiCX8Im1/wZGv/bVE6Y+rPN8aiyDlFOuIgNVCYgR2N9h3unoXsC/JJCdzhEPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiSEPO56;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D9606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DiSEPO56
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06e79e152so3217449b3a.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654540; x=1796259340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZdqz/5aN0a+Mnl2BFDx98pc2JPnx0esugp5NJKn2WQ=;
        b=DiSEPO56EYuafe0mJhdwC8cA0rzeVwaayI7NlmGRQ22CUF9yk/aWsrwHlM6mnNAEX2
         KpWJa1Ko9XupkNaKOHqPPkpZdjTOyzhLi4audBkISqnA61rfuj8Mn05L3IvQkAU7MIRo
         mCh6Jw3hCGFTfyoG+2OeNDow7LlgD5EWA8ZqY3yUAdlFIYLBmwuNmy0W8spzp/yR3hyj
         wtrUc+dffyqxapQ7bKGBWEv/BVPVetc8KuQ3Mzb0JBzAK9X38oMiBtxRtWAMlLm1Dasr
         YZ9oLXptcGhaPhOyhPUYJnNSwRtnj3xPxCMyliBNCviJ0p56eh60Lag3USrbweKjlasd
         dHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654540; x=1796259340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZdqz/5aN0a+Mnl2BFDx98pc2JPnx0esugp5NJKn2WQ=;
        b=HVbwwwY4JZp+RieksQSnTrhZ26Bl3zqyryIotB3xrYUAvtDp1TpbeoX/ll+Z/veBXs
         Kuytmkg2reUGLSEsqX59VsCF5XgbM2K731Fvj+yML1rya7B3DabrnQrCbWHHvmlJu1fT
         kiTv0ihdJxXe3Hl6pp7b/QLeC8Xj69pEtEuWT4jzJTYuHrLSBJomNUYJb1p74cOGX76K
         Udq/tDcYFHnN9L+76zaZALMcA0QJIJ8xwAFSRblF9Uxq4RNEvXdGPrLUl6sAsq60x9NZ
         b57yV8Iq+NgFDMqTfaQuLNPse+dXCsJZrVaktA78U8PFzKO6kOMLZSMqOgYzBEIh1yfU
         tLEA==
X-Gm-Message-State: APuU4Z9taeMkEDj8hpFMevlYSqmwyux9g704Iq3C6s4CQk+zf15fgz/0
	1QtG1pYPURPgLAkwJnVlmCGllT5o2Otv1B2/8SSHdQYrvu5gYlxhclTG/uAo+w==
X-Gm-Gg: AZFdTZcD7nsK61N3en2OGlTMI2XlZsF74hdJ2bMOYlurPU7Zx+U2HwUajQ+ULJ6FUsO
	FIVMB6muJs7HRPQarvoVqFfrqJivDg7Ks9/G8IuQrk0xwKqPx2oTDb7WT47xzR69HeUmfJnquZG
	J+dkBLdNETjvbrlUHv+EZH1whv48V1thiRoeC1Rf5QjCp6HO0/DRLhF5Fud/XCCVV4Vgfx1xB8s
	3rwUnf9b4hUtjViVek/oSVwliZz6fGLNOnN4M7buGUSIFiJlGcMTw/9QsxeL6TrxuKlQeytvgV8
	6YYaImIfS9SNOUKy05MXVvY5jI1lDFUmS9XIaXDH4/IpWL3I5/zlSbIStuzYO/L7Yk9/NQTqI7A
	g9f2lD/roTWRkrgqoqZkmkp3xaiu3nV0/+mjvz4xA7FSXJEmhlz0I2ove1l9Ig0THK3Z6aAfUC/
	yQ2IpE8qRMbxKFcXcDxHXY6wufEAo4kUpQCEem6RGlKoRXG9crJmzL9KhKL/8FWyD5idxI4KO6q
	oxyNteeBnRa9EIioix/wfZJz+8igGPth0UspDvk/Lx1yicP3RPBac9hGdGpPdGdLkBAwBBYORni
	EvUzg8x+4MbY5Bqx6W7Wabo2VI0YZpBwp8vKjCsYbAixwAyCqSl2FdYA
X-Received: by 2002:a05:6372:a705:b0:3e2:7c10:d465 with SMTP id adf61e73a8af0-4014e358b53mr14368648637.83.1795654539819;
        Wed, 25 Nov 2026 16:55:39 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:39 -0800 (PST)
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
Subject: [PATCH net-next v4 0/5] net: hix5hd2_gmac: Support fixed-link
Date: Thu, 26 Nov 2026 08:55:12 +0800
Message-ID: <20261126005524.4156940-1-mmyangfl@gmail.com>
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

v4:
 - reword in dt bindings
 - register MDIO bus manually
 - skip disabled mdio child
v3: https://lore.kernel.org/r/20261124002442.19414-1-mmyangfl@gmail.com
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

 .../bindings/net/hisilicon,hisi-gmac-v1.yaml  | 25 +++++-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 87 +++++++++++--------
 2 files changed, 77 insertions(+), 35 deletions(-)

-- 
2.53.0

