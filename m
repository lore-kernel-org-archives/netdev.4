Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014333;
	b=n/3l7rXeBxwE6WlsMZDiGjYBcb/oJnP1xTZ1xZtn+ePPEoz6jOGbxS0HjT1ZRVTSG3Ax
	 FEVrShHefWY3z3yPcm2XHfjfMME6UcHmzAk6qliuj8AChj3sN5hRzKRDwT63SQX/z3uxx
	 LZkM0fzKQr7gryyqygVIXtfiTI47RTpYWR2yJMaB0h6b7VJB+GThXQHT78MEEUEFQuJpa
	 WediMvefr60J2I1sw/lEaGPEIKDhIz/GdgKZvNYBTqLbD/2B7DPUqO0TPWJ1EUF3HWdzX
	 7vkx+i4zBzbbj0mNlUOh2JRKWfkkFlVDVAqDN+76YZZfgoSNdWpk0+uUwf19rVbcHQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014333;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=6iTRszDLgSnechhOUHyPOZvyahtQjIJTCNekuag6vcQ=;
	b=gJ+/vKT64OKg8svqFFknBkxJ2gN9EwxN5byBgXN09eCBRthMsowsHsfQGwiXS/hhFIGA
	 C85GJKpWqCqEjOjKzdNYjxFfCl7LOvlB2MiMhI2FyAh77/UIibYyrA1LQjvZ2D3c+R4Eg
	 5/3Th8mKqA7kHYGOPn6o70BMDmdXpKcRZT6rLYHOC5ihzqdofP/MyRcE5WwWY+NoV2ve2
	 DMt/Ftw5ApdeJPOJR3HPj19QcRP2Y1ko62UM9IM+QIdetk5rB8E09+Md3fHjxj/rx9l4y
	 lLOfsnfrJ59LBYS3C4Uh4JPo3LQ4Jl5FC16SlpFw3qtfNaJsEBAov2cNxBCK9wNjAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z7k4tOHB;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27678606A335
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27678606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z7k4tOHB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36F07C79A9F;
	Wed, 18 Nov 2026 15:05:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CC8F5FE9B;
	Wed, 18 Nov 2026 15:05:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82AFD11BC239C;
	Wed, 18 Nov 2026 16:05:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795014329; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6iTRszDLgSnechhOUHyPOZvyahtQjIJTCNekuag6vcQ=;
	b=Z7k4tOHB36yJP5ebYZ6FrAKqu5TF1aHa5eyp1sH+vqikVNp6cOotf1icXJuvQAGGF7JCla
	+qyUcBy4/YOASxGCw623+HRWM7w45GxR/8TqmVKzHAyqt6bxzr53jlbg2D2w45/wsHNcWk
	qiCAnGXsRbeKguS5RMqrZ3dN3N7Wjuu/3e1J/sk3U7I7WM/FkkpIhMoCG6ODypinBAVz0Z
	uQ3I9gAjqMOhsUsdjW8xkgqJCZq+O1jmZsj7y4o0jyajFk1CctOAW8i8xCqQO2+c+7xMJo
	DOwPhHZQ+Hv5S5HEJ9i8tfg78ybdNLrC5ZWTHTjF2sfyS1upeXGDA46jDhX+LQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Michal Kubecek <mkubecek@suse.cz>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	thomas.petazzoni@bootlin.com
Subject: [PATCH ethtool-next 0/2] ethtool: Introduce the --show-ports command
Date: Wed, 18 Nov 2026 16:05:20 +0100
Message-ID: <20261118150523.2762733-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
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
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

Following the merge of the phy_port GET ethnl command into net-next,
here's the ethtool counterpart that uses that commande to enumerate the
ports and their capabilities. This is queued for v7.4.

The output looks like this:

# ethtool --show-ports *

Port for eth0:
        Port id: 1
        Port type: mdi
        Supported link modes:  10baseT/Half 10baseT/Full
                               100baseT/Half 100baseT/Full
                               1000baseT/Full
                               10000baseT/Full
                               2500baseT/Full
                               5000baseT/Full

Port for eth0:
        Port id: 2
        Port type: sfp
        Supported MII interfaces: 10gbase-r

Port for eth2:
        Port id: 1
        Port type: mdi
        Supported link modes:  10baseT/Half 10baseT/Full
                               100baseT/Half 100baseT/Full
                               1000baseT/Half 1000baseT/Full

Port for eth3:
        Port id: 1
        Port type: sfp
        Supported MII interfaces: sgmii 1000base-x 2500base-x

Port for eth3:
        Port id: 2
        Port type: mdi
        Supported link modes:  10baseT/Half 10baseT/Full
                               100baseT/Half 100baseT/Full
                               1000baseT/Half 1000baseT/Full
                               1000baseX/Full
        Upstream port id: 1

Patch 1 syncs the kernel headers, and patch 2 implements the
--show-ports command.

Thanks,

Maxime

Maxime Chevallier (2):
  update UAPI header copies
  ethtool: Introduce a command to list an interface's ports

 Makefile.am                            |   1 +
 ethtool.8.in                           |  30 ++++++
 ethtool.c                              |   6 ++
 netlink/extapi.h                       |   2 +
 netlink/port.c                         | 134 +++++++++++++++++++++++++
 uapi/linux/ethtool.h                   |   2 +
 uapi/linux/ethtool_netlink_generated.h |  22 ++++
 uapi/linux/if_addr.h                   |   1 +
 uapi/linux/if_link.h                   |   1 +
 uapi/linux/netlink.h                   |  14 +++
 10 files changed, 213 insertions(+)
 create mode 100644 netlink/port.c

-- 
2.56.1

