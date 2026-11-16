Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820358;
	b=GFHjDQI+cn47214tPajw4laFA2YGORdgUD3LoAEWaVXCAjrimmwNB4EQVEDd1fHLEOWp
	 3dMCvxD84T6RkMr81Vj9nsSiEmBSkWc8dYa2Xr4g/1/SEBGHdDcjFYSYfeCsHe3QOC9SF
	 hW0oZe1TirN7PZamVYYWrG37SdUqy8cNvVdwlERCsindOP493PTBPZLRrwAwA4H59pRSF
	 Sw8fhtE5HXTKZUArhXsa9WTyvXXVPiQZhgNzeE9OIhUdkdyCHSTecc/FmC/mGjjHXVbwQ
	 CfMc+GCoOuLPcpRXhWFJ+1r1ARtH1zW9ONr/1pmQ3eO6th/xTS0RKyXWlu2N/in75tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820358;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Da04wmYwtqF0rkK+5K+q7oVszxerDFXdV47u8Mj7Xow=;
	b=ceYEkOmgYnMVu1lxjJC9drhaN1dkvBzgSkFDIk1t0t23hlNi4sIXb3pxcbCwG7vbxVkN
	 zk/xPx/pcesuOw6rGw8LvM/VGHhneWZjtba5Ub+9rZiDBcVQC0tLebXI/CU3KVGhodLWj
	 CBSoMC2zSDIYd6pulTWDZaHdN3pxQMghuC8A1GR/qZV/HWoPo8wVMa2T55wrGKO/edqBW
	 ELxWeAgTwn7q54JRB8UvW8rNAFASu/0lpJyDfvfvSu8ISYwO6AADMfAhz3R0Ur1wqzdL1
	 2ebGrCgFopZrCNWR2+rPrUfZ+elgRgcwBo4iD9tzRwrM568y2co0smORA5LrsIg9lPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2zFV2V5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBDC606A33D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2zFV2V5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCDA11F000CF;
	Mon, 16 Nov 2026 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794820357;
	bh=Da04wmYwtqF0rkK+5K+q7oVszxerDFXdV47u8Mj7Xow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P2zFV2V5JqKzSGMj3knwwbFbWRYaBDoNEER6xWc1yVtAg9EiEXCiquDIld5FtEN6S
	 g4igzAXHvuhCpkV2s2VyDOfLCZPnqWwiXz2SMAQRV3i3JVzj9EtAa8c4PJYGOsOT0p
	 eVsMeBnhwBVavN5HOrxX5YrauA7awtV5BqTXXcgEqWZu1TDOQH7JuqGZ8qbMESHxhW
	 29FSVVcHeJUMktwWdAdu6NEBZR+RmhZarMUENGMHGoeifsfAb77yk7aIgH7tnW+Wh2
	 mCcO6AS2sopldVUGGh9nU8zzkNl4eAnqYLfmuxmt2Gdq6ek35tRFwzEYMSFZC2M5+k
	 WV/eyfuv7RLIw==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xSslP-0000000344S-2Z4j;
	Mon, 16 Nov 2026 10:12:35 +0100
From: Johan Hovold <johan@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Hans-Frieder Vogt <hfdevel@gmx.net>
Subject: [PATCH net-next v2 1/2] net: tn40xx: avoid early firmware node release
Date: Mon, 16 Nov 2026 10:11:48 +0100
Message-ID: <20261116091149.730586-2-johan@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116091149.730586-1-johan@kernel.org>
References: <20261116091149.730586-1-johan@kernel.org>
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

The mdiobus allocated by tn40_mdiobus_init() has no primary firmware
node so its firmware node pointer points to the secondary software node
added by device_add_software_node() and whose reference is released by
device_remove_software_node().

As device_remove_software_node() clears the firmware node pointer, any
reference taken by __mdiobus_register() needs to dropped before removing
the software node.

Add a comment explaining why the driver drops a reference it never took
itself, and only drop the firmware node reference if it was actually
taken by __mdiobus_register() as indicated by the bus state.

Note that __mdiobus_register() will essentially only return early
without taking the reference during development when the bus structure
has not been properly initialised. And currently, not even that would
lead to a use-after-free as the child PHY node holds a reference to the
parent MDIO node, the child is deregistered before the parent, and
software_node_unregister() returns early if the parent node has already
been freed.

Cc: Hans-Frieder Vogt <hfdevel@gmx.net>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/net/ethernet/tehuti/tn40_mdio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/tehuti/tn40_mdio.c b/drivers/net/ethernet/tehuti/tn40_mdio.c
index fb1a4a2e4dbc..438f0d86c2a1 100644
--- a/drivers/net/ethernet/tehuti/tn40_mdio.c
+++ b/drivers/net/ethernet/tehuti/tn40_mdio.c
@@ -157,7 +157,12 @@ void tn40_swnodes_cleanup(struct tn40_priv *priv)
 {
 	/* cleanup of swnodes is only needed for AQR105-based cards */
 	if (priv->pdev->device == PCI_DEVICE_ID_TEHUTI_TN9510) {
-		fwnode_handle_put(dev_fwnode(&priv->mdio->dev));
+		/*
+		 * drop any reference taken by __mdiobus_register() before
+		 * device_remove_software_node() clears the fwnode pointer
+		 */
+		if (priv->mdio->state != MDIOBUS_ALLOCATED)
+			fwnode_handle_put(dev_fwnode(&priv->mdio->dev));
 		device_remove_software_node(&priv->mdio->dev);
 		software_node_unregister_node_group(priv->nodes.group);
 	}
-- 
2.56.1

