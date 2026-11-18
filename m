Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019783;
	b=Bn0wyb9kYhy00BlraJX2TD9nN5b/+kKx/P4LtUPxv3dJFWBNj+IiCizaiuq9EqQUzSHE
	 Jr7vxCMGoViDYPFndzGAUF5LTcY553xTq8M+MYSnEPmEbZQ27oQKabdijUoTnVw2G/N3c
	 wWwBD1g294v6JW91QCsE1TfjH2mWMSdkvgdxIQr8kt3bVpdUE17/CLeqXRW2nwx3EAGJy
	 fCOG/1m6TeGQUQhojtrOEaKxlassbK23QryCfPvE7gAFwxDaNEzy0lk1PYmWn2zmkRTmz
	 VpFQqQXuzCdbIS24uPxfUgkRUCmI5+b6h72hdHMLBbMPo+gdXkI5kfUxwABkBADkbpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019783;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aAm9CNuFj8TO+ZH7zqyjvtf7xWX3PWf+FUu6NgB/FdQ=;
	b=gmka3G2quatSQ569LWsl81gfc4wsVIX+M5FRnDtY7X1dsqlBfeBSNwlNNrqKsL36udZj
	 3CMjPEVi0HD7Y/SrtYCVUgv8JOYdCIueXfbDiD11LKa4U1YEeDI8yI3olA5KWeqzo+x/J
	 94fQ3MTnCyNZn3oVkfnSIjHmt85XHjCeKu3sLAxyOkw5YqGdTJSIVY05VEm2fXvxTnSxP
	 79jLRNI7x2TBVwPk5xvPva7EqViGKr5jHipq088oCdW8Z+bkRRUmwzXm8krUI8BsqsTAY
	 R9HmDdry4mpur/ph8Vx+ryuPKpcKoz7TCUffFkAp6MZBmmjsLmodlsGIoKmbHg95BxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrDooXSj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A8D606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrDooXSj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11DA1F000C5;
	Wed, 18 Nov 2026 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019783;
	bh=aAm9CNuFj8TO+ZH7zqyjvtf7xWX3PWf+FUu6NgB/FdQ=;
	h=From:To:Cc:Subject:Date;
	b=TrDooXSjdEXC0MK+f9uta8zTAU2TnoNwvw9x7zOzZ+Ak6uo/tf/a0vYp8byqYLFW0
	 7LZWlvjeBZY6scWPCEAH+tLeiopmdIT8Zfpao//nVhPMUpezlT1ZKPQKEp6YSGN434
	 2mdaAebb8X3DrwXL+gVUNiwrpAFBhNCtZ/wigyfSrm/CPSsmqU7FkjIUvMwV3ppwas
	 ulTS99ojEyH8J36VMH7Akj3B8IDZ9CF+FieGDbebCs2ty24TrPmWgDqtlnS1ejFPRl
	 YTgUiaLHKmEgiXXQ+epkNtnsq8blsRtSpzZwybAOUPGK7aDM/1OVdGu6Lxmye2DKBX
	 F11KoFcek1JIw==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xTidw-00000004mtV-34a4;
	Wed, 18 Nov 2026 17:36:20 +0100
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
Subject: [PATCH net-next v3] net: tn40xx: avoid early firmware node release
Date: Wed, 18 Nov 2026 17:36:02 +0100
Message-ID: <20261118163602.1141227-1-johan@kernel.org>
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

The mdiobus allocated by tn40_mdiobus_init() has no primary firmware
node so its firmware node pointer points to the secondary software node
added by device_add_software_node() and whose reference is released by
device_remove_software_node().

As device_remove_software_node() clears the firmware node pointer, any
reference taken by __mdiobus_register() needs to dropped before removing
the software node. This is currently done unconditionally however, which
could result in the dropping of a reference that was never taken if
registrations fails early on.

Note that __mdiobus_register() will essentially only return early
without taking the reference during development when the bus structure
has not been properly initialised. And currently, not even that would
lead to a use-after-free as the child PHY node holds a reference to the
parent MDIO node, the child is deregistered before the parent, and
software_node_unregister() returns early if the parent node has already
been freed.

Avoid ever releasing the MDIO software node before it is deregistered
and fix the asymmetry and layering violation by making the software node
a primary node which is released when freeing the mdiobus.

Cc: Hans-Frieder Vogt <hfdevel@gmx.net>
Signed-off-by: Johan Hovold <johan@kernel.org>
---

This was something I stumbled over when reviewing the software node
implementation and the patch has only been compile tested.

Johan


Changes in v3:
 - squash the early release hardening and the primary firmware node cleanup
   into one patch

 v2: https://lore.kernel.org/all/20261116091149.730586-1-johan@kernel.org/

Changes in v2:
 - only drop the fwnode reference if it has been taken
 - amend commit message and explain why this does not lead to a UAF
   currently
 - switch to primary software node (2/2, new patch)

 v1: https://lore.kernel.org/all/20261110100051.2567443-1-johan@kernel.org/


 drivers/net/ethernet/tehuti/tn40_mdio.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/tehuti/tn40_mdio.c b/drivers/net/ethernet/tehuti/tn40_mdio.c
index fb1a4a2e4dbc..4130d75fbcaf 100644
--- a/drivers/net/ethernet/tehuti/tn40_mdio.c
+++ b/drivers/net/ethernet/tehuti/tn40_mdio.c
@@ -156,16 +156,14 @@ static int tn40_swnodes_register(struct tn40_priv *priv)
 void tn40_swnodes_cleanup(struct tn40_priv *priv)
 {
 	/* cleanup of swnodes is only needed for AQR105-based cards */
-	if (priv->pdev->device == PCI_DEVICE_ID_TEHUTI_TN9510) {
-		fwnode_handle_put(dev_fwnode(&priv->mdio->dev));
-		device_remove_software_node(&priv->mdio->dev);
+	if (priv->pdev->device == PCI_DEVICE_ID_TEHUTI_TN9510)
 		software_node_unregister_node_group(priv->nodes.group);
-	}
 }
 
 int tn40_mdiobus_init(struct tn40_priv *priv)
 {
 	struct pci_dev *pdev = priv->pdev;
+	struct fwnode_handle *fwnode;
 	struct mii_bus *bus;
 	int ret;
 
@@ -191,13 +189,8 @@ int tn40_mdiobus_init(struct tn40_priv *priv)
 			return ret;
 		}
 
-		ret = device_add_software_node(&bus->dev,
-					       priv->nodes.group[SWNODE_MDIO]);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"device_add_software_node failed: %d\n", ret);
-			goto err_swnodes_unregister;
-		}
+		fwnode = software_node_fwnode(priv->nodes.group[SWNODE_MDIO]);
+		bus->dev.fwnode = fwnode;
 	}
 
 	tn40_mdio_set_speed(priv, TN40_MDIO_SPEED_6MHZ);
@@ -209,9 +202,6 @@ int tn40_mdiobus_init(struct tn40_priv *priv)
 	}
 	return 0;
 
-err_swnodes_unregister:
-	software_node_unregister_node_group(priv->nodes.group);
-	return ret;
 err_swnodes_cleanup:
 	tn40_swnodes_cleanup(priv);
 	return ret;
-- 
2.56.1

