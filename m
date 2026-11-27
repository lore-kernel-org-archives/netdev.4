Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784875;
	b=pSKVhBLnIMM558eSs8JBEf7A7cs5I4Hx5IcxLcaIrOYnX7sHDj2whrCCiJR6JbxujHld
	 2MIpYL3+SxS1mjOyGCpN13nT8wg1uvZMviHvdXnkhYkZKEWEtdKXCiChGNgoJ2zEUPpBZ
	 vWFZaPjv0FrkL8g8jYUK7sagMtQIdgvHwboqpzGjfPBd25wCB0XP9RArt4e2S6Qg/jS6f
	 VfofniTk4Aoyyb555wE8guR84ssVQgM/W23LeFAXXPNlURAXVEJgWpZI6t+z7Twn4vjV3
	 JiyfDAjkLA35mkHSTK4E4edp5J5ic7pzwSNyHK0YWpICoAQ0qI2a805Cbq2uIwyxHtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ijCcEu/XLQwc3B0jG3H2IvbuucYEaV6jcq96t9cxNCA=;
	b=GkFvYQ8HImhPPJgdEYL8hqasDpZOseuhQgQeT0+V2q05H+Bx8fZ7H1y/httUP/oWulTZ
	 zlwU14VGndFw2j56n4Uq3bIdVg9EvGpe9AEJxWtNNUlDF8uJFfkpeIH4fPCOmOY9fDaJH
	 xxoohL6cjxe7LdYrm6I/RYDUTfZPVAeHoY9pIJFCs9xq3OTuGa0HBgdKerzUh36tb/HBe
	 nkizL+HsCX4fRiwy8jWAhVCoiaOBPwhsI984L9AE0OktyQgHEY2io6CvhtkiQGSStjJsr
	 NVxnIlM0s+bjVQYkQfIvOAb4qphKcFP7FWuU9ydDn2e3QNjTYG2XXHzRbI5IMaOmn6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6LMD18h;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB662606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB662606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6LMD18h
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8d1aec63541so675426b3a.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784874; x=1796389674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ijCcEu/XLQwc3B0jG3H2IvbuucYEaV6jcq96t9cxNCA=;
        b=u6LMD18hkaK2iyL2rTA6qLbRHePQJddzH/CZyyL1iav+dwgXyYHl5Q40TP8PGJrDY2
         rc+iG3rrb7xTF00GIJiXl+yziXMUQBcg0FEvEU65xl/3rlLYXX+vx5k1Q81N7JMzlAZA
         lgjEJ4XeZMwHc88684p6VXhh0IRQIu2IC5i7WraahyJNdRKZztAD6AfDUzrJrHz2mtpW
         e2bZYX2FAtuZ86NOUUWX24sl1hfiQTqYJ9TPpyv4Ro8Nh+kUzRuQAWIvSYbqcdM7eYVM
         bLPfxiJ5I3VCnZp+ztPaF27OXIGD4bT+wOmIDqV0YfWU+EKcmrU81ysQqg/NALoJeA45
         B+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784874; x=1796389674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijCcEu/XLQwc3B0jG3H2IvbuucYEaV6jcq96t9cxNCA=;
        b=1oA8NZaN+ytoegw8+8NLFlHmiz00RqSvCR/ww8PbyyXwub+ghb4aKCgglxlV8MgsCx
         2E1m76N+XeHyEEhIoNahM9vuknodWzedQ4VCvUb59aFygUg1zTV6CpSPyMGYY+VDE5ov
         AP1L5mFUwJWM0miDTZUq50vMLq4ztAMYNvR1wPv3MxFVzu1geyBITX1qpNjtZXRYSZDO
         tYjQnb7Rku8yPS21v9OB/1krhntf48heXYgCr5vN6OKeISnCsEEVHON7kidlUKEmDbUg
         Lxcb52G5zeXURs3vetB5OoWsFcKagl/6qhFQVMIQsp97R40f7AxVRtDcs4UsJ1oeMc0Y
         ZeQw==
X-Gm-Message-State: APuU4Z+bT4Psb/LU2zzBflLgoR3jROi76WB8YJz8FVmIDByeYQkMfiRT
	5SsgNwArnxJhrJL+5rNgwyzTJmInLxUvPwB5mXXwlWjcoXHeneYC3NBMLrFs5g==
X-Gm-Gg: AZFdTZeM/mbU6RWZsFAr99BLKBpAWXl/cvxsxJQbuRtqVZnRUJ4ieEDeVZLz25gPTYH
	JtI1mtYAa+/Sfe5XdZHVPQCMaY3NxpxnBNgfAIa0T+Uzs6o4vEd9g6nTllHm8+DNkZTZszlZUyD
	3f0ydCNcbIJVO9owfGJeDfCFBOlzM8gHJuyj9rFtA7dL0BhR0q3HZ+sXnTzIZnUYoyeqDp3KjVh
	oZqqKgsMV4/SUExe09eysxtGOWSxKs/9cOZEuYgnojStoJxWaqgTmhWDZinJoCUUyLK4+a7Q21+
	ATOvaE1iFxeFy908jQLjcynqo7FTMhbhTGMLDNbZDJ+XUBxWpPAVUY6ewdjW1qDyClVS2hbNghQ
	UB3zkN5u5+xbyOxCHh/DHYPDEZ3xj2eQk9hNqHyz8fPc1gQx9qsKd1u4Vi7Yg3p+69vsR9htuUd
	EHSJ9tvo1BECfsXh5/w52EwMMyi1j3cYSlMQhfJQYLrNWF+BrCU/fTH4s/nc5bNku/d0tHfolkk
	KbzafKYsxt4oytv1Qlo01JmMSSPuusn54a8qEuLgwXejn3bz/2E2d5xWtRIGydoLcin3Yx/kg6Y
	YGh7j0kyoI7+Im+usNPPwXdXcF2W/OWvLdmTqYb30KRPhWvWq2OkfGo=
X-Received: by 2002:a05:6300:8a0c:b0:40a:4b4e:e078 with SMTP id adf61e73a8af0-40a4b4efb1bmr3555693637.23.1795784873791;
        Fri, 27 Nov 2026 05:07:53 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:07:53 -0800 (PST)
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
Subject: [PATCH net-next v5 0/5] net: hix5hd2_gmac: Support fixed-link
Date: Fri, 27 Nov 2026 21:07:23 +0800
Message-ID: <20261127130729.1263920-1-mmyangfl@gmail.com>
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

v5:
 - fix bus registration for in-band links
 - check NULL for priv->bus on remove
v4: https://lore.kernel.org/r/20261126005524.4156940-1-mmyangfl@gmail.com
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
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 89 +++++++++++--------
 2 files changed, 78 insertions(+), 36 deletions(-)

-- 
2.53.0

