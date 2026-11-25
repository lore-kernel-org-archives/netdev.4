Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626171;
	b=YK6K6Y+BFSaKsJL+DNMg1S/qfmNfkndtCux31XT5Ku3LzQmq7GIjPtdNtoaubwT9yoQr
	 xVqjoXQTNvqaycz0aQyQ7ggoOyC7jEw1ROXgt8KMxgVx16vXmprJl3PRzjYNo5IjV+iHx
	 H5mFAAk6IfNdjnQYePc1v6yCg26SW4yuDr6imjQcxNH9bNbfdyFf5w7BjLa34dOg8AbnO
	 F5BPI8U4/5vLJBN23ynovhBjS19qQz5tBUqTw7WnvHy6dxmXXdhK5ouGuMAH89Nn+REcE
	 TGkSsojot52FMjnIGWFFjVVs1dHxWBUe1JenmxN+eq9NdzyjlATd5EaHGu3yp9mi0Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626171;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=3Bl4bY0f4tRkLUvhl89b/lgPXpjJRlSTErGIkJizz8k=;
	b=ShVhV8A6ejB+P9/e8eSETzf2bgGNtvbrYHeL7c7gdtV3MXP6gPcwnDW7NCIz1QB1yB/G
	 Q+wHBcxaz62+c6yAxQCKW9pCfuwrOz07EDPKmENOA/JLiceurCRg8+JrFY9LdkhYNZ+IF
	 b2XAFaM/WMkCjsGORZYf8mHfitogljQq1px7vvvWUtwbUS33XO8zErQaHg/AeMPHs8hnb
	 BMWJ5fEOzPtyZ1WLb96wDuPIhBdlsY/eXEghwgDFxtSCEHIh9xa8xZQbCa/Zayl0aH30d
	 teymODab9Fo68plPExU7ajcQ97HzawhMzyvL8eahGWvkMN+2F1WNySa3QUS6LI9ZLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DwzXTse1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5622E606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5622E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DwzXTse1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795626169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Bl4bY0f4tRkLUvhl89b/lgPXpjJRlSTErGIkJizz8k=;
	b=DwzXTse1jUG6CaVxOaeJuiKHpn2CIAwU/YD8dIYfFRsI2Yt+f49rhoCrOFFO2jX3ysx4ws
	RsQLb8I5vv5eoIrR5lV2canU7F9/0h0sduX+miqjaN1HZwmyfMAefEw5FSCigMG4hIitGh
	bAkQ+BXfkaSNCG4OEfrGcY4UzKaJdqw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-ZRlGUv2BNlGhy0LUDCr3jg-1; Wed,
 25 Nov 2026 17:02:44 +0000
X-MC-Unique: ZRlGUv2BNlGhy0LUDCr3jg-1
X-Mimecast-MFC-AGG-ID: ZRlGUv2BNlGhy0LUDCr3jg_1795626160
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85B9F1954221;
	Wed, 25 Nov 2026 17:02:38 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 86F593001DBE;
	Wed, 25 Nov 2026 17:02:35 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Milena Olech <milena.olech@intel.com>,
	Michal Michalik <michal.michalik@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [PATCH net] dpll: send the device delete notification on the last unregistration
Date: Wed, 25 Nov 2026 18:02:34 +0100
Message-ID: <20261125170234.294969-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A DPLL device can be registered more than once. mlx5 does this when
several functions of one NIC share a device. dpll_device_register()
sends the create notification only on the first registration, but
dpll_device_unregister() sends the delete notification on every
unregistration. Removing one function then tells userspace that the
device is gone while it is still registered and still listed by
device-get.

Send the delete notification only when the last registration goes
away. Send it before that registration is removed, so the message can
still be filled.

Fixes: 9d71b54b65b1 ("dpll: netlink: Add DPLL framework base functions")
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/dpll_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 277692d12d3d1e..c32e59f3e25afa 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -534,12 +534,14 @@ void dpll_device_unregister(struct dpll_device *dpll,
 
 	mutex_lock(&dpll_lock);
 	ASSERT_DPLL_REGISTERED(dpll);
-	dpll_device_delete_ntf(dpll);
 	reg = dpll_device_registration_find(dpll, ops, priv);
 	if (WARN_ON(!reg)) {
 		mutex_unlock(&dpll_lock);
 		return;
 	}
+	/* The device goes away with its last registration */
+	if (list_is_singular(&dpll->registration_list))
+		dpll_device_delete_ntf(dpll);
 	list_del(&reg->list);
 	__dpll_device_put(dpll, &reg->tracker);
 	kfree(reg);

base-commit: 7ed616970b652ae76d99a01b468588e491021648
-- 
2.56.1

