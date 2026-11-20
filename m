Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170505;
	b=MYlzLOjgYkhSLmnwhyrExGY5ETvyc13b+ymRaDf7sVaJiYedbuXLb3W1G2ujSER1bdUF
	 PFLzUJdx3mhxfX9B+zuu2n4Silse+lhBtS1fjxty3TlQFULs841j4T7tPkuFgF3XueGgc
	 UsWicbVYGz8aoqwL39NKkYbCe/vR4+mIJJMsA4fE+z/Srv4hwbzPpYlglo39viapxDVBN
	 3XNabDHCwDyDosxL9NFr+H6naf1mVqHoD9bUePjb7YJe+cY3ecZVdvXNvE3cu4rITLgOQ
	 9zd2/ZXc/MYyflVAiBbXbgEIGzGXM4fWnlHCvIQqDSTjmFKckFd2MeQjuICBOiQwNvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170505;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1JfPmK1yn6pui7HGEcUCJpESlVMMPdHeni16EmQ9iEQ=;
	b=FBDtRcClM8yqZSNdZBHZrtK41x/WXKviHN5EKzkSotYraTyCq5zO/QE8Yn3bj0WFDF0K
	 opi3tF/ilonqh1rxtspDJvSl5C/VtCvHg+4TTAO/g9Jh9OTULKG/Uzf1LCWxY9vOJMCNz
	 mEEru0XWqvgxyHB0BNSTKIEV3cTpurJ1IyEuU0jTn4hzQJPnldbElhpfAti7OjF1Hx6AD
	 ziErtL5EQajWH6LxgfMjSACG2NbkQLYNFVigeJPOOZfxXbPUDdhl+zf18mZD4Hhj8LB3V
	 HI+3gVeEc38Pu7pF/MjUyb3CswmBqk4o21lxBXLLeSMADEGCdL6fvAiHqh2M/PGgi1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=6g9dtMgV;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E10606A32C;
	Fri, 20 Nov 2026 10:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E10606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=6g9dtMgV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795170504;
	bh=9Pq5Y3RNHqDCQ9HoKS8CL459rcOwXtJCZyScXxSgXCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=6g9dtMgV5KNsmxCd8Rm8eGPcl/6Ees6YQA6yNfscOndpkqx1ABPniuy+7AGpQi9oa
	 5tAgX6wPBAoqTQoW4Y9dTDd+rendmWguAkyijO0+ovdvRZvhKzSplXiw+/4kb3sSQW
	 kAI5QKSPfH5S9FDoMHXrrZrJJNc/KamDXDkv7525OKuR2kc44/CUAFfqh6Z3cEoeK9
	 jEidGEy9Riu8xbdC2vGqkJyGCYfJHShLqlMVyfuMGUbeBjRJWJ3sbTdnXFx69pxp0C
	 4U5ThMuD8zE2I3QvXIasefdPTEzB5EuFeIdSj03qU6yvYvrQypQnhUSzKtcqmoXMs8
	 mFEup3OHWMF+Q==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 7A97B8D803; Fri, 20 Nov 2026 10:28:24 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the device at shutdown
Date: Fri, 20 Nov 2026 07:27:53 -0300
Message-ID: <20261120102754.778283-2-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
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

No .shutdown here, so reboot, kexec and power-off leave the MAC and
DMA running. This chip keeps its registers through S5 too.

Hook .shutdown to stmmac_dvr_remove(): interface closed, DMA and MAC
stopped, PHY dropped.

Suggested-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 42f0b11a7b60..63ce2301a0f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -374,6 +374,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
 	.id_table = dwmac_motorcomm_pci_id_table,
 	.probe = motorcomm_probe,
 	.remove = motorcomm_remove,
+	.shutdown = motorcomm_remove,
 	.driver = {
 		.pm = &stmmac_simple_pm_ops,
 	},
-- 
2.56.1

