Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725293;
	b=EoeeQTQ5gq+krl/Tye34BKz7KKlxr3xjVXWJiWb9Ab67dtlKie8Ckrj6UBzr1EGdkBFT
	 mDnBejoE2WDKxbYUgr4pDSNyIFaWo4jeA0aLywXfrm+p+y/ZW/uz+qGWFrr28/CGu2rXj
	 W5UK0Rzn/4rJBDKEvq8VpkSvCMVyitGuHtlAjUlk+/SrNxgQCzAGasmH4Uz7ZRpXjgtVt
	 8PK0W8ss3B8hJe/zej7u1cPdG737I7p+Asx2b/hn4jkWdzD21fIPTYzkBt7QTgwlPSbF4
	 5lLQbGWJUOS0UxShLy3JJD1GR6W2AjOa0JDfmBl/X80Z6Tg20RJr+zeycxIZr7/TlLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725293;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=XCoP2lR9dWoXQubbwuHi5uO9EefUEvGruaOQqElQJIQ=;
	b=hWQUCA+7K3Ferypkrgin6J2+mCWR/61vyEeBkLY+yvQFKx16iFGjvfAXnVHXdGQ/8+zB
	 Ejl0GI3ZnSjzplUdntHKQ5kwPIhpCUr1gRrqQ/lQ1sr+fQ+NqC1tRqycvx0CAB7TEtDM9
	 9qQYHvzSFmrBnWCA1oa7Rd9Vs/iC5ebkyJ1jmW/DVnid9c7Kb8VQzze8pgJnWVcBeA560
	 QANY8GmFXP4nBac16/CAhfETlAvyKjzC+FqRL3W0Z1l5gOMze9QpxShMj1gAVxYTsbRMG
	 pvP+axlVo6ZTF3Z2VmoAN1CQY+VTg3GZaDmGE5IOwfJFhdJZvOYPBEFBVbUdr1UXgYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MAHlOpgB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4E606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA4E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MAHlOpgB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCoP2lR9dWoXQubbwuHi5uO9EefUEvGruaOQqElQJIQ=;
	b=MAHlOpgBQ3RhDtaOPmZ14fc7AytIilW4K790T0siZOeP24WEfGfvmS1GmJZDgn7sst2qIu
	3wB5RxTM+Fq2+ysl4xCa8w9q6iVfHHBQzXDDcZq3X/R8JFGnlhQil58S8z3n8gmI7/TF3P
	ImRyxlHF9k73Rst6WAMOg6xAjEZX7Go=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-ztZ9ANb3NOyqu-W7-jAr4g-1; Thu,
 26 Nov 2026 20:34:45 +0000
X-MC-Unique: ztZ9ANb3NOyqu-W7-jAr4g-1
X-Mimecast-MFC-AGG-ID: ztZ9ANb3NOyqu-W7-jAr4g_1795725282
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 345001800471;
	Thu, 26 Nov 2026 20:34:42 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 19AAF1801977;
	Thu, 26 Nov 2026 20:34:35 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Min Li <min.li@microchip.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH RFC net-next 18/19] dpll: drop the owner reference selection of pins
Date: Thu, 26 Nov 2026 21:32:30 +0100
Message-ID: <20261126203231.934632-19-ivecera@redhat.com>
In-Reply-To: <20261126203231.934632-1-ivecera@redhat.com>
References: <20261126203231.934632-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Commit 2c1bd78dc8e2 ("dpll: use pin owner's dpll ref for pin-level
attribute reporting") and commit 84e85c325e5e ("dpll: use pin owner's
dpll ref for pin-level attribute setting") made the pin-level paths look
for the reference of a DPLL of the pin's owner, because a pin could also
be registered with DPLLs of other owners.

Every DPLL a pin is registered with now has the owner of the pin. Use
the first reference of a registered DPLL and drop
dpll_pin_own_dpll_ref_first().

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/dpll_core.c    | 27 ---------------------------
 drivers/dpll/dpll_core.h    |  1 -
 drivers/dpll/dpll_netlink.c | 20 +++++++++-----------
 3 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index af61c4882c2b6f..a58cd22164f0be 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -1229,33 +1229,6 @@ void *dpll_pin_on_pin_priv(struct dpll_pin *parent,
 	return reg->priv;
 }
 
-/**
- * dpll_pin_own_dpll_ref_first - find the first owner dpll ref of a pin
- * @pin: pointer to a dpll pin
- *
- * Search pin's dpll_refs for a ref whose dpll matches the pin's
- * (module, clock_id) tuple, i.e. the dpll registered by the driver
- * that created the pin. This ensures pin-level attributes are
- * reported and modified using the owner's ops even when the pin is
- * also registered with dplls from other drivers.
- *
- * Return: pointer to the owner's dpll_pin_ref, or NULL if no
- * owner ref is found.
- */
-struct dpll_pin_ref *dpll_pin_own_dpll_ref_first(struct dpll_pin *pin)
-{
-	struct dpll_pin_ref *ref;
-	unsigned long i;
-
-	xa_for_each(&pin->dpll_refs, i, ref) {
-		if (ref->dpll->module == pin->module &&
-		    ref->dpll->clock_id == pin->clock_id)
-			return ref;
-	}
-
-	return NULL;
-}
-
 const struct dpll_pin_ops *dpll_pin_ops(struct dpll_pin_ref *ref)
 {
 	struct dpll_pin_registration *reg;
diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
index 6e10aadd2123d9..add518fef295d8 100644
--- a/drivers/dpll/dpll_core.h
+++ b/drivers/dpll/dpll_core.h
@@ -103,7 +103,6 @@ void *dpll_pin_on_pin_priv(struct dpll_pin *parent, struct dpll_pin *pin);
 
 const struct dpll_device_ops *dpll_device_ops(struct dpll_device *dpll);
 struct dpll_device *dpll_device_get_by_id(int id);
-struct dpll_pin_ref *dpll_pin_own_dpll_ref_first(struct dpll_pin *pin);
 const struct dpll_pin_ops *dpll_pin_ops(struct dpll_pin_ref *ref);
 struct dpll_pin_ref *dpll_xa_ref_dpll_first(struct xarray *xa_refs);
 bool dpll_pins_linked(const struct dpll_pin *a, const struct dpll_pin *b);
diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index 6a46130fc687eb..ac341e3eba61ac 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -745,9 +745,7 @@ dpll_cmd_pin_get_one(struct sk_buff *msg, struct dpll_pin *pin,
 	struct dpll_pin_ref *ref;
 	int ret;
 
-	ref = dpll_pin_own_dpll_ref_first(pin);
-	if (!ref || !dpll_device_registered(ref->dpll))
-		ref = dpll_pin_first_registered_ref(pin);
+	ref = dpll_pin_first_registered_ref(pin);
 	if (!ref)
 		return -ENODEV;
 
@@ -1134,8 +1132,8 @@ dpll_pin_freq_set(struct dpll_pin *pin, struct nlattr *a,
 		return -EINVAL;
 	}
 
-	ref = dpll_pin_own_dpll_ref_first(pin);
-	if (!ref || !dpll_device_registered(ref->dpll)) {
+	ref = dpll_pin_first_registered_ref(pin);
+	if (!ref) {
 		NL_SET_ERR_MSG(extack, "pin owner dpll not found");
 		return -ENODEV;
 	}
@@ -1180,8 +1178,8 @@ dpll_pin_esync_set(struct dpll_pin *pin, struct nlattr *a,
 	bool supported = false;
 	int ret, i;
 
-	ref = dpll_pin_own_dpll_ref_first(pin);
-	if (!ref || !dpll_device_registered(ref->dpll)) {
+	ref = dpll_pin_first_registered_ref(pin);
+	if (!ref) {
 		NL_SET_ERR_MSG(extack, "pin owner dpll not found");
 		return -ENODEV;
 	}
@@ -1245,8 +1243,8 @@ dpll_pin_ref_sync_state_set(struct dpll_pin *pin,
 		NL_SET_ERR_MSG(extack, "reference sync pin not available");
 		return -EINVAL;
 	}
-	ref = dpll_pin_own_dpll_ref_first(pin);
-	if (!ref || !dpll_device_registered(ref->dpll)) {
+	ref = dpll_pin_first_registered_ref(pin);
+	if (!ref) {
 		NL_SET_ERR_MSG(extack, "pin owner dpll not found");
 		return -ENODEV;
 	}
@@ -1458,8 +1456,8 @@ dpll_pin_phase_adj_set(struct dpll_pin *pin, struct nlattr *phase_adj_attr,
 		return -EINVAL;
 	}
 
-	ref = dpll_pin_own_dpll_ref_first(pin);
-	if (!ref || !dpll_device_registered(ref->dpll)) {
+	ref = dpll_pin_first_registered_ref(pin);
+	if (!ref) {
 		NL_SET_ERR_MSG(extack, "pin owner dpll not found");
 		return -ENODEV;
 	}
-- 
2.56.1

