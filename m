Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510767;
	b=JjNhcUVqtgpn43RGeIcF9+b94mR7ZZP5Uqg+lD+O79dDepbeV6sbGOjL7bGFFVYAc0KC
	 ZDE/isKk5RzZaYzKz4fs1TtBD984wuXUzrZK5mn9trgRsIPdYRjrCQFvOxCrovAl+y9Mz
	 gKWKrUXOC02fCnWYnD0kJxcpS9sNbnybXZF+n0dtght3RJoFvWbgDW6epFJuAN8dBBpoJ
	 49uln6JqGL0S07aHs/mUSrzblurhyvROL1xgKES7Gk4RL1sSN5ti/uG5vJiHB/Qez9aOq
	 u5ix3jS7VHuL3gVr3AXlD2daPNhkOMTZMZG+BK+Q5H/Eyaeop5zFvIxlEAhkxFM7f+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510767;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=lIYZVD2078uZopDO/+14qXWFBtXrBaP8RVS/8lfqMXU=;
	b=L07vJnnojoqY72XwO8XOEv91bKcuIw5vREmQVHnipRuPzeSXFQZlsaspMIq8i2RbFJZA
	 AY/KsRkONerQsPb5m7UUcvbr5AGeisd4KAVJA5Gi3yJfDQRNNF8Mps30KZw+8rDSq/K9e
	 YOQ1eya40I/DPUFP0Ntl1iy2nZEe+4GwIeTte38XzsHD28cf60QVCaXgjbtXLCIEZ200d
	 n3RTVwBRp7HLbR2i+vyS8gMhiaPVXXOQubbS51Z0lL3+VBJfUV/PgmKYhMGjzltaNHblr
	 WMyGAHNEdPoV5wx8sTZCBCFcui75FfEZSk1Uxko8D83v4r/uGmzvNZBdMgL+iueElJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=eXTyMtFV;
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EBF606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1EBF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=eXTyMtFV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795510764; x=1795769964;
	bh=lIYZVD2078uZopDO/+14qXWFBtXrBaP8RVS/8lfqMXU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eXTyMtFVp/8473q7LhstWY1L18WZTIkfr16cKhBzHTWJNRfxmrG/S4s8V5VhNPKIR
	 24OoCy2c/o+PM05gd9LJsHUHNzCbxwtsuaNeVcX9iMGRdSz1knPzCQDXlKHevFc0JF
	 hj+HvNOTzJJo+qTqHbGEId1DLBrr0QyfYkVBayeRJBKEzbOqjPKNLQnuwMTM5wLatH
	 H3xSruJddpL6lGuhqICqkec6I1d+SPNCARjc9aRPN1a2gsHLxM/L9IPXzEfUScgAYY
	 C2watanXv0R8gYvlYZ6EljNMfRF1zBsYJgWStHfhUZXM/lU5PSqFlSaqDYi0goXn1K
	 d4PSjtrDjjULg==
Date: Tue, 24 Nov 2026 08:59:21 +0000
To: alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com
From: Lee Keon-Hyeong <leegun25@proton.me>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net v2 2/2] mac802154: look up children by extended address
Message-ID: <20261124085905.710751-2-leegun25@proton.me>
In-Reply-To: <20261124085905.710751-1-leegun25@proton.me>
References: <20261124085905.710751-1-leegun25@proton.me>
Feedback-ID: 167971190:user:proton
X-Pm-Message-ID: ff6304ac1af91820a6186e6f7dbf0aee523bb094
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The source address of an ASSOC REQ is always an extended address, but
mac802154_process_association_req() builds the lookup key with the
address mode chosen for the new child.  With alloc_addr=3D1 the new child
has short-address mode, and cfg802154_pan_device_is_matching() rejects
short-mode queries, so the lookup never matches.  Every retransmission
is then appended as a new child, consuming an association slot and a
short address.

Look up the existing child by its extended address.

With max_associations=3D2, two association requests from the same peer
exhaust all available slots and prevent another peer from associating.

I found this during an LLM-assisted code review and reproduced it with
mac802154_hwsim.

In a separate mac802154_hwsim test, 64 requests from the same peer
left 64 child entries on the unpatched kernel.  With both patches
applied, the same test left one entry.  Kernel selftests were not run.

Fixes: 601f160b61b2 ("mac802154: Handle association requests from peers")
Signed-off-by: Lee Keon-Hyeong <leegun25@proton.me>
---
v2: Drop the added comment and move the lookup fix to patch 2/2.
v1: https://lore.kernel.org/r/20261121133101.240921-1-leegun25@proton.me

 net/mac802154/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac802154/scan.c b/net/mac802154/scan.c
index 943641702646..6158ef41c0e0 100644
--- a/net/mac802154/scan.c
+++ b/net/mac802154/scan.c
@@ -881,7 +881,7 @@ int mac802154_process_association_req(struct ieee802154=
_sub_if_data *sdata,
 =09/* Ensure this child is not already associated (might happen due to
 =09 * retransmissions), in this case drop the ex structure.
 =09 */
-=09tmp.mode =3D child->mode;
+=09tmp.mode =3D IEEE802154_EXTENDED_ADDRESSING;
 =09tmp.extended_addr =3D child->extended_addr;
 =09exchild =3D cfg802154_device_is_child(wpan_dev, &tmp);
 =09if (exchild) {
--=20
2.56.0


