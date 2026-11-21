Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267878;
	b=cbQOHhbe/uyr5hssHT1jPJTLZZBwFnlwW9tQ0P39Lq9Wd/OwJnvJ+qkgeIJrxJUtsefq
	 hSKpVBomvXA/DF0u9zE4bE2XLjdkVVB0E7d6RnpsfbHq5oCFQsrpMDHem1E+FXkwoRtKD
	 KC0pKPQEMQptDbkU1X3DN8s4ETF5MdHSNTjrE+uTJ4xxnE1dauVu3OHmlHmD+Tjop72YM
	 W/NnWlBrSSJUAWsPtAZOv4kUayxT7usPnmhf0Uo+XZWvLAFbQiHQKLUcUoAiWiaBiKkIZ
	 DPcb48yyRW+Q+MKrM5eno9D2Lk30mbptpwpCUyvOZgwxu8KOWabwF+TdwJgj2t2senw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267878;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r0MMOix26sOHkfFFJ+zGS98rI+ooroQaiLjBZdvKtOc=;
	b=Tb1gx9SpWae0dWcy7hiJAjSfLQ+DrhDjCQ4ap9ajDdlRAQJDYWNvlpRo53yGTRh8h9f3
	 TTf33nh9SsLDUsrMQ0TLZSwYfKJ80NAj0BCbyt7taIKtzhXLGK4IaFoy8jKWvEyTeq7Ee
	 R2Wo/D1azXYaINYZqy+6DS3RCVXSJYSHT+vBkInwi/eikvZlWWF2RJXW9SO45TClfMg88
	 arQcGpnyJxF8X3kKRBVpGR+wLtck0YJYYRFtjbvWYuLAsZ7qDh0rwrIDYEtLSfwZxrz+0
	 gBIRTmq11sVsydCTLiZ+u2AfjCa0I9p02whEtA7tgVLaaSGpjCGRPfTZiuBaTkkTfrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=UdKJC4Op;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD12606A331
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD12606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=UdKJC4Op
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795267873; x=1795527073;
	bh=r0MMOix26sOHkfFFJ+zGS98rI+ooroQaiLjBZdvKtOc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UdKJC4OpGKs6IIj40qUl7G9xRz6bpqnKYpdEJBL679KzL6q7oRTAVIviMyVLuCJ0e
	 qzxkHlCTMrMcPkb/YBZaks+sIgFzuQHakRfMx2k/LymNHpFRwrgYV4UTNTsLdr2Btu
	 210nGAzbaT3+2Hqz0Jom5xkyC4FfZi9/dbFx6Oo1s6fS0LEY7EEdfYyROQvqXfs484
	 Y603I57rR7SNu1edc304FGXLtwgo7ANRog86ZotTn+0fH6KJ4sxiPEPPqPUdz7T7FK
	 /VagQ2sik5hVxezAGJVVH8FbAslOquSI3CJOPUJ1ib4D3yh8AX1hZ09ooppIi/89ef
	 r8FaXwJeqiXNQ==
Date: Sat, 21 Nov 2026 13:31:08 +0000
To: alex.aring@gmail.com, stefan@datenfreihafen.org, miquel.raynal@bootlin.com
From: Lee Keon-Hyeong <leegun25@proton.me>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net] mac802154: fix duplicate association handling
Message-ID: <20261121133101.240921-1-leegun25@proton.me>
Feedback-ID: 167971190:user:proton
X-Pm-Message-ID: b887ac16e5f89a15f617a51968b25e1e49c49dbd
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

A retransmitted ASSOC REQ from an already known child is supposed to
replace the old entry, but the lookup uses the new child's address mode.
With alloc_addr=3D1 the new child has short-address mode and
cfg802154_pan_device_is_matching() rejects short-mode queries, so the
lookup never matches and every retransmission is appended as a new child,
consuming an association slot and a short address.  With alloc_addr=3D0 the
lookup matches, but the old entry is only list_del()'d without kfree(),
leaking a kmalloc-32 object per retransmission, and nchildren is
incremented again for the replacement.

The ASSOC REQ source is always an extended address.  Look the existing
child up by its extended address regardless of the short-address mode
chosen for the new entry, free the replaced child, and count only
genuinely new children.

With max_associations=3D2, two association requests from the same peer
exhaust all available slots and prevent another peer from associating.
With alloc_addr=3D0, 300 repeated requests leak 300 kmalloc-32 objects and
inflate nchildren; a subsequent disassociation leaves the counter
inflated, and an interface down/up does not reset it.  Both behaviours
were reproduced with a monitor/coordinator pair on mac802154_hwsim and
are gone after this patch.

Fixes: 601f160b61b2 ("mac802154: Handle association requests from peers")
Signed-off-by: Lee Keon-Hyeong <leegun25@proton.me>
---
 net/mac802154/scan.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/mac802154/scan.c b/net/mac802154/scan.c
index d393b1f4e..ebef22e7e 100644
--- a/net/mac802154/scan.c
+++ b/net/mac802154/scan.c
@@ -879,19 +879,23 @@ int mac802154_process_association_req(struct ieee8021=
54_sub_if_data *sdata,
 =09=09"Successful association with new child %8phC\n", &ceaddr);
=20
 =09/* Ensure this child is not already associated (might happen due to
-=09 * retransmissions), in this case drop the ex structure.
+=09 * retransmissions), in this case replace the ex structure.  The ASSOC
+=09 * REQ source is always an extended address, so look the child up by it
+=09 * regardless of the short address mode chosen for the new entry.
 =09 */
-=09tmp.mode =3D child->mode;
+=09tmp.mode =3D IEEE802154_EXTENDED_ADDRESSING;
 =09tmp.extended_addr =3D child->extended_addr;
 =09exchild =3D cfg802154_device_is_child(wpan_dev, &tmp);
 =09if (exchild) {
 =09=09dev_dbg(&sdata->dev->dev,
 =09=09=09"Child %8phC was already known\n", &ceaddr);
 =09=09list_del(&exchild->node);
+=09=09kfree(exchild);
+=09} else {
+=09=09wpan_dev->nchildren++;
 =09}
=20
 =09list_add(&child->node, &wpan_dev->children);
-=09wpan_dev->nchildren++;
=20
 unlock:
 =09mutex_unlock(&wpan_dev->association_lock);
--=20
2.55.0


