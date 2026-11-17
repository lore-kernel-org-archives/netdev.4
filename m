Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915883;
	b=NWxk73kXE/hvI7DyJMVoYmjDdHhyLhrbzKwvngK7XxVoozoDUAogUqe+I8sVtOeZnKKQ
	 PziiOT8l2FbsyHmfUKdFhnUKWf7N9ZPh6lv9yGuQL4ivPyeReBrZzT/4axLYU0b1LX1Gb
	 5xUdeKgWF9B2gL23P8fZUyV0ckM0YtQy+0MnoySNCEw/8gr51XpLpKK1mChYInGaue/2r
	 H68RT45qL210BhrtekXmgmdhmLLJeiqKl0jIUfngpCl88o7tGLSHarPTTwJWaIZ7/u5VK
	 qh4OmDi5PsUOJ23AXRJuiFoQ4q7+Z1RCiHp1Z4ADGcUmEi/SiPFWXH8Z7cLu22Pyn6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
	b=mD2bblCqDs0HuL2fr6C8gWPgaT5Ng8f+FpNnOiNVP0Za2xUjYOmCL+gZ1Wh+81x5yiKA
	 flKcDQfNXrLOmI30TfYdEwQUqc3DSGDIZZA7fnN14i0/PSgquJci/wPqEcyf5PatDU+LH
	 aDENE4bt7U/cM4Tgu4H4yiUDGnNuGOZE9PfYFjYC0+btu2c3RH1ZVrjfV8Yn7X6HaNHwR
	 8jlmvh+ZjxpFEE6qWSHquPkAqzvuWKzwhAKc+YUZSrKudgHRJxWm179p7vvVh/2hT+sjB
	 Tkv44VJ3xpq/OLrDdRm8Sy2P0LqptDcgesAgeVHQGSyNtbrUga5x1nqa5IMt06ahEZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD6606A33E
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DD6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bccecba199so4855831e87.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915881; x=1795520681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=sl6D8KA3FdArmPRJE/9/3+w04VGmJDoM2kpUiE3bxNH3r6gjXuJ31wqpbPJm8xLQSP
         ReziKQZ/ww36NUUjGiK9BugbjFwhJGiKbpgb3teYqK1i/JL/DWtLuselX4Cktw4IsSzn
         BbS+lxVRb75D57P+c+oDj1oeo9TBDnsDy0dYgEs+bZBkveiGTIAT+dh9oDpb/3ydcdlp
         RcQGXATiDmRYmyANYlJNcW3h36Y2lZ/W2oQxqsSRJNQ4mh6d9h1jUgkLydLKZFO2Jw6y
         65VBX951hp9eNUwdUNBY0ktRDQ0mqSVT/Hel2uek/GoRydpA0ZdH5+mf9tHsdQhnKko8
         jJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915881; x=1795520681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=V2owqX2iOp6XTQFoq/YOo6W4evCX4UAW9Ygam8p3s57S3dOhVWcN2OXiGb+SkqauA9
         aXYlLpkWGaQUokK0Hb6mB/SoaktCxUN9SjvOX2PIpri3aHqoUJW+c46i+jc/5eA1DFYS
         4nzAJIab5HNSsgdSZipdzbWrj4Yw3qblTXWWUO1YSvJkQqXaRV9q9meiAL3yukYa437y
         joYqE5ZxC9z3E7oqBbXMlZznz0IcGuwZltzd61dxSD0m7pQp18/QxVgTfw0Q0YBGmLp7
         e7AFeqvGhb4XQsQf3JUGFf21qnBr1MTycRZjMf5jvEo04H1CNFJ0oitQuSiZENpBpCSC
         L86w==
X-Forwarded-Encrypted: i=1; AL+hErEVN3i2cstXuE/sSu7fSHQBvKqoM/dBvpATsXae3k3gWWD5eVyB/02L+yRilW5KuTkkJlw9Pqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z876UILG1gtiHdB99LOPKnNmfWd7LZWO5cJv1LFAmsgJ/yPtUho
	7JhY0h0gT3oojMAoXbUcoYLAUhCKRjPk6QIYDn1XrOGS7wYx7ShPKMDv
X-Gm-Gg: AYBFou0tyGK1Iul4BOa6sKRyVn7fIjue527sHjfrCkVkOD4yKzP8bpHmupFFx6/Ibwu
	LPCZsGz6Ss5H2pC0qbMLEkuaklDTPPDz2/PCyB6B4IA/263CRa1L862qMO5Vr+OkH8Q0fFGbbF6
	cDsDg1uLz01dUO/UoPTsyTtLYlqDxXTBH+chx7V7Dv2+7pkVDZy5IzSPocImOYfkOFgwMRxyEyZ
	B3RaxsyCfrSYuUAfkjIQD5mHWNY8vmriEgqMQUgmF160cd3Peuep6l5uYAWw58HEE2xm+YI9i5z
	UfgKIRbUoCY3Rpq/AQ4kDnrLkmP6giCRCUGKFwtbF30QmDKmGPOQGd7MyyY3tNeDS1QAT/ViJ5A
	9ga1N/3kZxz2jl7BRe4Nk9uI1+VkMGwC8UprIPKEh3Xb3b1BJH0TztrieEC6DUST3nkt+Beo5oL
	p+0Xf6moL9rQaWnSFU1/IBHrhvPOk+7b9+CYHDfq9i0++yxFxade9tt8LtGzUhpE7bkmtpwKFc0
	c0ycVjVYOsx/iTnMjQ9ZdTAh2Wzt3jvt+HeNUUJ/uzNkmDhozenuR7EZx8R451eOCA6nVAlPXdL
	yP4VwEgORzmnAgTc9y7S4M74pEv/vXljmJ2OAqSoepd0j4w=
X-Received: by 2002:a05:6512:2246:b0:5c1:56f5:fabc with SMTP id 2adb3069b0e04-5c1709b2313mr5888936e87.24.1794915880522;
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 17 Nov 2026 14:44:27 +0300
Message-ID: <20261117114432.2794961-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

