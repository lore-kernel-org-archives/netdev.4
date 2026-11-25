Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632998;
	b=exb26XdVgw9CEkOTi3PnjaXo7MiZSXCAVaeIBgb2/fv8mrq/Q0NLl7DcrGN/NL1zA8Jn
	 Qqtht/Z2/00t8mi40vAA3+o8s2HaqO9j/39Rru06Wzxa9yx8JovlugRMzyVvo67uNlmx+
	 NQyjONIBqXTBPhRQhCFLvzunx5QgdzrYzD3alNLceFZ+c6TJOEurmJtDl+J5t+ZeaIPWi
	 fD2UD3N9MrsDx/wGi3tieWMNcOdNtyPdeQVrVNChZJkNii0yTWrkBhySVvI/c22OqcyZK
	 oncHlXfSpdVzSMU7vuOl4w4UXA+KUcVgKzhsqgMan9GNlrZyLhiPKPNXJvWbbSjOyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632998;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=iGi8lwqnAta706WgksGnBCYKzmrKdw94fixpgghCkGQ=;
	b=NemVovVN3KLMPE7xdzFGiBDLcNpQS4zy/ffMmqZ7Uf4sRApz8cxfApl7K6SXlu7xw8Xz
	 KQOkL+VFdyyItPRiciHXVp49dpi8u9FoKFK9y74rx8RQLjSd9yBQrx/EptRII5cW/WAed
	 Cv7jsO1uqOwt5mfV9M1gZa0wPpuqCAcIQbHbSwsJwHk+GrLJJzKqkaMohQ6NWu9dfXvcf
	 Vqe/IRZWBHnjtiyvwDBGlcM17hVIZIKTAxEBiMofrPtAJOLELC0sq7Y0OAub5ryYHi4ZZ
	 6cHGd6/fDdB8tZKEM4lgDP1PK9g33RaXmwA55haNHwqfmCkRg8PHYRJT+Y2eNOrsnTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=h4jvNObx;
	arc=none smtp.remote-ip=185.136.64.227
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43286606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43286606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=h4jvNObx
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202611251856283b997065370002074f
        for <netdev@vger.kernel.org>;
        Wed, 25 Nov 2026 19:56:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=iGi8lwqnAta706WgksGnBCYKzmrKdw94fixpgghCkGQ=;
 b=h4jvNObxF+mH/vApHPiIWERWFGPLBTcDrcBT1ImViyeuDkTq50zRq/8Cd5kI1qlAL11UcR
 naqdGFONPuGmeJ1J80eSa5Dx0gIaJZSCmev5NqR512osYMrvt3cI3dFuW/0un7+1VaotOpNi
 6QmODVjOocA4HSTnqaIJhrthXweaqLLKdRHxwMcGV2NrUm/VlMEc+mrM1XTNkpfuiaqYz4xI
 sXkVEfGxfLJ5TcJLRfOvshiJobU3Yf97iy8MuMZX2iM9kJmd31GmAKnS65XXoQQXRB1KRpLB
 MwSSKY2/LOBU3nSe0ZNWQwrLMqytj6FsXCUad791rtoL1NB8t76nsvvw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: netdev@vger.kernel.org
Cc: Lukas Stockmann <lukas.stockmann@siemens.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH net-next v2] net: dsa: lan9303: add LAX9303 dev id
Date: Wed, 25 Nov 2026 19:56:22 +0100
Message-ID: <20261125185625.3692515-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Lukas Stockmann <lukas.stockmann@siemens.com>

LAX9303, automotive version of LAN9303, does return 0x9E04
instead of 0x9303. Add this as a new LAX9303_CHIP_ID.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lukas Stockmann <lukas.stockmann@siemens.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2:
- "insted" -> "instead"
v1:
- https://lore.kernel.org/all/20261124151221.2480934-1-alexander.sverdlin@siemens.com/

 drivers/net/dsa/lan9303-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/lan9303-core.c b/drivers/net/dsa/lan9303-core.c
index 8eeb8953ff24e..17189bda07c8b 100644
--- a/drivers/net/dsa/lan9303-core.c
+++ b/drivers/net/dsa/lan9303-core.c
@@ -27,6 +27,7 @@
  */
 #define LAN9303_CHIP_REV 0x14
 # define LAN9303_CHIP_ID 0x9303
+# define LAX9303_CHIP_ID 0x9E04
 # define LAN9352_CHIP_ID 0x9352
 # define LAN9353_CHIP_ID 0x9353
 # define LAN9354_CHIP_ID 0x9354
@@ -903,7 +904,8 @@ static int lan9303_check_device(struct lan9303 *chip)
 	}
 
 	if (((reg >> 16) != LAN9303_CHIP_ID) &&
-	    ((reg >> 16) != LAN9354_CHIP_ID)) {
+	    ((reg >> 16) != LAN9354_CHIP_ID) &&
+	    ((reg >> 16) != LAX9303_CHIP_ID)) {
 		dev_err(chip->dev, "unexpected device found: LAN%4.4X\n",
 			reg >> 16);
 		return -ENODEV;
-- 
2.56.1

