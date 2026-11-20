Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168458;
	b=xbLtgD3PsIwqgoRXnmTxyYoJXrNiNRRJpYR7HV8uhpTuAwqA39MTauGRc1JQCXZbqwWT
	 mNs0Btu0f1dFiWznBjFD69kz7e5rBjxrGpzOrEJ3O2fFXMsf1u/S2UBtU3wD9CwtwIDiu
	 ksql1ot3jnWjh4t7/9xke7MmvDAn55t8HaxOyr+r4VppQCt2slda4N+wzuf/TtjTkkBFU
	 KQNhWcmUPlGwVoo66WFv3LtxhBDx2CI0I41TZ74q5v9RWUjcktO1jcUKTV1VJAPbM9Ueo
	 gbKcKzHY39iE37UEZO0SYc5wpaGpkt/K08ZdXd9t6uMivNsCdnB357DKLZi8/nSPCAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168458;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Organization:From:To:cc:
	 Subject:MIME-Version:Content-Type:Content-ID:
	 Content-Transfer-Encoding:Date:Message-ID:X-Scanned-By;
	bh=qpRttPPBlZ4X69dgUQaNkCKtIP7rRP0bzyjnS47bzfE=;
	b=i4vTSWO4ZYzQv8BbX8APR3MAVI5RrNNU6/flrDdJ55+LIyWgdYDCvfoc0rCRngSKIdHA
	 O+pvrVR2lS+Cs9Kpc5VPVFexQqww9MVbsj6OLAa9fJCHhjdtmAByQowJtf52EW3GfyKxe
	 QE2RxvOV/x2XVoTaanyYdasLBi1uIsYAb+WikSDP1IzzsFSnaJ/deJunZkcyLABYS3o6j
	 HZYMUv8oAN8mXY0GdUbGYMgKu/Kn4jOqioCe/LU4XMNOXXz7QQdLEvC0qFYR1JPPZ1mFE
	 y7IJQOio9+8AbCcWFGDqeM4X9tznyqiuvtNUI7ld1n6HN7ei0UoCnor2IfyN0VvkKwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cMm8liy4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44819606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44819606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cMm8liy4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795168456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qpRttPPBlZ4X69dgUQaNkCKtIP7rRP0bzyjnS47bzfE=;
	b=cMm8liy4rNcAfNX5p4nACye3t0joVtKE1Q4oM0jdleVKrKVyGZBBfjmSqwwmuS6mDyLZSC
	Lmr3U1UrKTB8EMGmgkcA51HytcJrv/gGbh9PYEEP0g6PmJGSkLKDiF+qfQyfCV0LIf6GEh
	1qjltLikeC2BDiEWG1Q+WUZdisJzceA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-8jolAHOtPRWZMoEA0u-KZg-1; Fri,
 20 Nov 2026 09:54:11 +0000
X-MC-Unique: 8jolAHOtPRWZMoEA0u-KZg-1
X-Mimecast-MFC-AGG-ID: 8jolAHOtPRWZMoEA0u-KZg_1795168450
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9965C1800540;
	Fri, 20 Nov 2026 09:54:09 +0000 (UTC)
Received: from dhowells-thinkpadp1gen8.rmtgb.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A09EE30000D3;
	Fri, 20 Nov 2026 09:54:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
cc: dhowells@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
    Jeffrey Altman <jaltman@auristor.com>,
    Eric Dumazet <edumazet@google.com>,
    "David S. Miller" <davem@davemloft.net>,
    Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>, linux-afs@lists.infradead.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH net-next] rxrpc: Fix the comments saying RFC8958 to be RFC8985
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3457199.1795168445.1@dhowells-thinkpadp1gen8.rmtgb.csb>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:54:05 +0000
Message-ID: <3457200.1795168445@dhowells-thinkpadp1gen8.rmtgb.csb>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Fix the comments saying RFC8958 to be RFC8985 - ie. The RACK-TLP Loss
Detection Algorithm for TCP.

Fixes: 7c482665931b ("rxrpc: Implement RACK/TLP to deal with transmission =
stalls [RFC8985]")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeffrey Altman <jaltman@auristor.com>
cc: Eric Dumazet <edumazet@google.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
---
 ar-internal.h |    2 +-
 input_rack.c  |   20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..f0c8cbcc5dd5 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -1264,7 +1264,7 @@ void rxrpc_tlp_send_probe(struct rxrpc_call *call);
 void rxrpc_tlp_process_ack(struct rxrpc_call *call, struct rxrpc_ack_summ=
ary *summary);
 void rxrpc_rack_timer_expired(struct rxrpc_call *call, ktime_t overran_by=
);
 =

-/* Initialise TLP state [RFC8958 7.1]. */
+/* Initialise TLP state [RFC8985 7.1]. */
 static inline void rxrpc_tlp_init(struct rxrpc_call *call)
 {
 	call->tlp_serial =3D 0;
diff --git a/net/rxrpc/input_rack.c b/net/rxrpc/input_rack.c
index 9eb109ffba56..072e1d9ecb2e 100644
--- a/net/rxrpc/input_rack.c
+++ b/net/rxrpc/input_rack.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* RACK-TLP [RFC8958] Implementation
+/* RACK-TLP [RFC8985] Implementation
  *
  * Copyright (C) 2024 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
@@ -57,7 +57,7 @@ static unsigned long rxrpc_tq_nacks(const struct rxrpc_t=
xqueue *tq)
 =

 /*
  * Update the RACK state for the most recently sent packet that has been
- * delivered [RFC8958 6.2 Step 2].
+ * delivered [RFC8985 6.2 Step 2].
  */
 static void rxrpc_rack_update(struct rxrpc_call *call,
 			      struct rxrpc_ack_summary *summary,
@@ -98,7 +98,7 @@ static void rxrpc_rack_update(struct rxrpc_call *call,
 }
 =

 /*
- * Detect data segment reordering [RFC8958 6.2 Step 3].
+ * Detect data segment reordering [RFC8985 6.2 Step 3].
  */
 static void rxrpc_rack_detect_reordering(struct rxrpc_call *call,
 					 struct rxrpc_ack_summary *summary,
@@ -143,7 +143,7 @@ void rxrpc_input_rack(struct rxrpc_call *call,
 }
 =

 /*
- * Update the reordering window [RFC8958 6.2 Step 4].  Returns the update=
d
+ * Update the reordering window [RFC8985 6.2 Step 4].  Returns the update=
d
  * duration of the reordering window.
  *
  * Note that the Rx protocol doesn't have a 'DSACK option' per se, but AC=
Ks can
@@ -192,7 +192,7 @@ static ktime_t rxrpc_rack_update_reo_wnd(struct rxrpc_=
call *call,
 }
 =

 /*
- * Detect losses [RFC8958 6.2 Step 5].
+ * Detect losses [RFC8985 6.2 Step 5].
  */
 static ktime_t rxrpc_rack_detect_loss(struct rxrpc_call *call,
 				      struct rxrpc_ack_summary *summary)
@@ -239,7 +239,7 @@ static ktime_t rxrpc_rack_detect_loss(struct rxrpc_cal=
l *call,
 }
 =

 /*
- * Detect losses and set a timer to retry the detection [RFC8958 6.2 Step=
 5].
+ * Detect losses and set a timer to retry the detection [RFC8985 6.2 Step=
 5].
  */
 void rxrpc_rack_detect_loss_and_arm_timer(struct rxrpc_call *call,
 					  struct rxrpc_ack_summary *summary)
@@ -255,7 +255,7 @@ void rxrpc_rack_detect_loss_and_arm_timer(struct rxrpc=
_call *call,
 }
 =

 /*
- * Handle RACK-TLP RTO expiration [RFC8958 6.3].
+ * Handle RACK-TLP RTO expiration [RFC8985 6.3].
  */
 static void rxrpc_rack_mark_losses_on_rto(struct rxrpc_call *call)
 {
@@ -285,7 +285,7 @@ static void rxrpc_rack_mark_losses_on_rto(struct rxrpc=
_call *call)
 }
 =

 /*
- * Calculate the TLP loss probe timeout (PTO) [RFC8958 7.2].
+ * Calculate the TLP loss probe timeout (PTO) [RFC8985 7.2].
  */
 ktime_t rxrpc_tlp_calc_pto(struct rxrpc_call *call, ktime_t now)
 {
@@ -309,7 +309,7 @@ ktime_t rxrpc_tlp_calc_pto(struct rxrpc_call *call, kt=
ime_t now)
 }
 =

 /*
- * Send a TLP loss probe on PTO expiration [RFC8958 7.3].
+ * Send a TLP loss probe on PTO expiration [RFC8985 7.3].
  */
 void rxrpc_tlp_send_probe(struct rxrpc_call *call)
 {
@@ -356,7 +356,7 @@ void rxrpc_tlp_send_probe(struct rxrpc_call *call)
 }
 =

 /*
- * Detect losses using the ACK of a TLP loss probe [RFC8958 7.4].
+ * Detect losses using the ACK of a TLP loss probe [RFC8985 7.4].
  */
 void rxrpc_tlp_process_ack(struct rxrpc_call *call, struct rxrpc_ack_summ=
ary *summary)
 {

