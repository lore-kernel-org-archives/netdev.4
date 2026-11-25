Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598248;
	b=yiyloC/IsSJuYHIuDwS1z8zpFumpFMOkeWjk9RnuqDqegONZ6UPxwxIcNpwwrRlUQjDm
	 deb09oZpciiSZeP70yDZbJukaCjBk5XQB6vvcOHF/G7ipCzDTkzXTdCh7iYHIk7qD8Tyq
	 rGLHf58StwI/VXsbCBoJRZGSCGjCCFtiN/YI1IWaGEOTB48YzXHAIyvGVrJ2XLuXIrs/S
	 x0YBv0orCfZ2vNf617TCcagfqL32Z15u9ZnTNPUwbTxLxnQJYAWsLYdTLUdu8bLeUX+b6
	 8DdSIlB4aUwJzq5p6SbJx9XpA4un7UYne5NH5XFP3SmbA1wHxKfBQIuTjg9Cyz9Qyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598248;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=NyInYMes5vZZ4aTZqa6HmB678lRLyvyGRNy8G2HRzP8=;
	b=x15FSykonR9OoFIUn1DsqPaoS4FWhxaYsod+qUuFSmWnw76ZvkKj1JN4f+hs7/SbZenP
	 Wuu8NjDpVph1ffK7yTBjkuwlkL22JaQTv7j7+9HwuAdq0MGm3g8ZC/HvezPPfMqy29gUH
	 2zw1QwD3URxRqM52VdW7VfAWa0NwlcdHJgZh4+RbzKCTgJP0RNeC2+Gu44SYQyZA8kHtw
	 1ZKY+YEShb+NehYoz+BAAiQRmmMzeI9qYMT6zuRYEONev0IJHBkXcsjk80Jp81gcZq6wr
	 YFfbPLeX412OOnc++ITUchKP2EWTN+BGsEfiWCgMKCAKbNZ2BkkQrMhbD/U05YpqgUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=h2keI320;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EA606A68B
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6EA606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=h2keI320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ny
	InYMes5vZZ4aTZqa6HmB678lRLyvyGRNy8G2HRzP8=; b=h2keI320pXD2yHTt07
	D5bTPSX5RdWRGSDj7arfuFunnCMgxor/wTnSTOBfWOm+tRtLRN3pbRcCYuBuDh5H
	37FsDsmNeiCEX3LQts+nwko/CEfSnWQOSfZl+0rJVU9vsxAexP6/fNH83OwkdVBL
	2Bv0u2AcsQ6UqwcOG8MA06k6Q=
Received: from ck.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAnBhJ2pwZr3Vt1KA--.4721S2;
	Wed, 25 Nov 2026 17:16:39 +0800 (CST)
From: ck <mjkchengke@163.com>
To: Frank.Sae@motor-comm.com,
	netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mjkchengke@163.com
Subject: [PATCH v2 1/2] net: phy: motorcomm: return -ETIMEDOUT on BMCR reset timeout
Date: Wed, 25 Nov 2026 17:16:37 +0800
Message-ID: <20261125091638.1847020-1-mjkchengke@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125085509.1844883-1-mjkchengke@163.com>
References: <20261125085509.1844883-1-mjkchengke@163.com>
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
X-CM-TRANSID:_____wAnBhJ2pwZr3Vt1KA--.4721S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWkXF1Duw1fKFykWF17Jrb_yoWkAFb_Gr
	y7ArsxXw4Dta12k3Wvk3ZxZrWay3WvqF4fXrnrKryayFy7XwsxW390vrn5Jr1xWFs3uF98
	Kws3X340k347WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRtkuUUUUUU==
X-CM-SenderInfo: ppmnux5hqjyvi6rwjhhfrp/xtbC9hdjsWsGp3cAtAAA36

yt8521_modify_bmcr_paged() waits up to 500ms for BMCR_RESET to clear.
If the wait loop is exhausted, the last BMCR read value (a positive
number) is kept in ret and returned through phy_restore_page(), so the
caller sees a non-negative value and treats the failed reset as
success. This contradicts the helper's documentation ("returns 0 or
negative errno code").

Return -ETIMEDOUT when the reset is still not complete after the wait
loop is exhausted.

Fixes: 70479a40954c ("net: phy: Add driver for Motorcomm yt8521 gigabit ethernet phy")
Signed-off-by: chengke <mjkchengke@163.com>
---
New patch in v2; patch 2/2 depends on it.
 drivers/net/phy/motorcomm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index a87e83fdf5..ba3421ca4d 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -1595,6 +1595,7 @@ static int yt8521_modify_bmcr_paged(struct phy_device *phydev, int page,
 			if (!(ret & BMCR_RESET))
 				return phy_restore_page(phydev, old_page, 0);
 		}
+		ret = -ETIMEDOUT;
 	}
 
 err_restore_page:
-- 
2.43.0

