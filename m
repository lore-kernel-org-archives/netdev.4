Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683938;
	b=dj5XH57moxZVfDi8gYdT9ggBQPV0/J8hSQKP/ovH6fhRPmRsJunxhSp0iwXs6DulZ0jL
	 yFT5KqqwfBiq40fomxOC2J1pyKTLAaFIAOcfJ21DjR8/Pc38+TZNYsBdir6lE/j9erLJT
	 h7MeqHf9/AmCa3bBzuFsg65Y/Y6/R+8JC18xzBIoAKyGK4ZYqvbOQS63JGaryfTF19r5L
	 6rcAJ0gaxwM87wYkRuDunGKQTfJJXQrepuJ/v68sr7CHs3KdrNUX22rT2WUpoDpuDNz7q
	 n+cSKiIFFlYS8Zm/95FKYDoev6Wlq/JDnOrjuZY/Wlimc5FkNfozF4tlcNzF9WXmZMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683938;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=8EnDFqFZhi4WNiwO0UjM4diYXockTAoNZIK0/UWf+Sc=;
	b=DYLxSuJXqhe14uWUn3oUXb/UbqrK/KZq5zeS+dhm2HChlABZtJTaKNrEY6p5Vq9hY4Ul
	 kraujenmjEZXtecii8b7/X4cznz1PrLxvTgpV0ctpUcX241liuNC/yscmzQn+VNyA5amy
	 AZqNDlINAmpuSWvX0+0aJpy87BxDhRRY+CipKsOot9FeNQSlQdfXeZKsDCBUh3HvIb/+m
	 4GvXeBjHbXwicdVxvcdtn8h4DnIaF4SuW/OIsXShGTd+uLIpw0KNgBKEXeecbXOXErILa
	 KFo+bLbXFjIEkp38N0w0KO+eXjn9reSouJC70Vzs0sNvWQWkMevWaXMDEI4Hdei6vRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VkuOVtqA;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6CC606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VkuOVtqA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795683936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EnDFqFZhi4WNiwO0UjM4diYXockTAoNZIK0/UWf+Sc=;
	b=VkuOVtqA7FqXA6NcOUTxj2Ph6B1Xa9RW5r+bEDM1vdpm7yue6hf0jv4WcrTUhc2T3Z6MDY
	zRiO/PJ2wnHwaPoJ751KIsi9GctskRxAavI1rwfOP9/WQtXHsTRj+xKTtvhZrsXWpVe3/U
	5x25/+oushUXKP8LmH34VnQsK2ye59k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-z-5WuWHyNTelctoQFMZjuQ-1; Thu,
 26 Nov 2026 09:05:32 +0000
X-MC-Unique: z-5WuWHyNTelctoQFMZjuQ-1
X-Mimecast-MFC-AGG-ID: z-5WuWHyNTelctoQFMZjuQ_1795683931
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1ADBB1800623;
	Thu, 26 Nov 2026 09:05:31 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B66334B;
	Thu, 26 Nov 2026 09:05:28 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH iproute2-next 2/3] dpll: add the generic device type
Date: Thu, 26 Nov 2026 10:05:11 +0100
Message-ID: <20261126090516.4278-3-poros@redhat.com>
In-Reply-To: <20261126090516.4278-1-poros@redhat.com>
References: <20261126090516.4278-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

DPLL_TYPE_GENERIC is the kernel device type of DPLL devices that are
neither PPS nor EEC, and the ice driver registers such devices. The
uapi header in iproute2 already has the value, but the tool has no name
for it. Such a device is shown with "type: unknown" and "type generic"
is refused both as a filter of "dpll device show" and as an argument of
"dpll device id-get".

Add the name to the device type helpers, to the man page and to the
bash completion. The list of device type names used by the two error
messages moves to a macro, as is already done for the pin types.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 bash-completion/dpll |  4 ++--
 dpll/dpll.c          | 10 ++++++++--
 man/man8/dpll.8      |  6 +++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/bash-completion/dpll b/bash-completion/dpll
index cfd39c5e0c7a53..0251df81159792 100644
--- a/bash-completion/dpll
+++ b/bash-completion/dpll
@@ -70,7 +70,7 @@ _dpll_device()
                     return 0
                     ;;
                 type)
-                    COMPREPLY=( $( compgen -W "pps eec" -- "$cur" ) )
+                    COMPREPLY=( $( compgen -W "pps eec generic" -- "$cur" ) )
                     return 0
                     ;;
                 mode)
@@ -127,7 +127,7 @@ _dpll_device()
                     return 0
                     ;;
                 type)
-                    COMPREPLY=( $( compgen -W "pps eec" -- "$cur" ) )
+                    COMPREPLY=( $( compgen -W "pps eec generic" -- "$cur" ) )
                     return 0
                     ;;
                 *)
diff --git a/dpll/dpll.c b/dpll/dpll.c
index a0a5e3f9a2f152..8dc1b8f5033fea 100644
--- a/dpll/dpll.c
+++ b/dpll/dpll.c
@@ -806,6 +806,8 @@ static const char *dpll_type_name(__u32 type)
 		return "pps";
 	case DPLL_TYPE_EEC:
 		return "eec";
+	case DPLL_TYPE_GENERIC:
+		return "generic";
 	default:
 		return "unknown";
 	}
@@ -817,11 +819,15 @@ static int str_to_dpll_type(const char *s, __u32 *type)
 		*type = DPLL_TYPE_PPS;
 	else if (!strcmp(s, "eec"))
 		*type = DPLL_TYPE_EEC;
+	else if (!strcmp(s, "generic"))
+		*type = DPLL_TYPE_GENERIC;
 	else
 		return -EINVAL;
 	return 0;
 }
 
+#define DPLL_TYPE_NAMES "pps/eec/generic"
+
 static int str_to_dpll_lock_status(const char *s, __u32 *status)
 {
 	if (!strcmp(s, "unlocked"))
@@ -1290,7 +1296,7 @@ static int cmd_device_show(struct dpll *dpll)
 						   &filter.present,
 						   DPLL_FILTER_DEV_TYPE,
 						   str_to_dpll_type,
-						   "pps/eec"))
+						   DPLL_TYPE_NAMES))
 				return -EINVAL;
 		} else if (dpll_argv_match(dpll, "mode")) {
 			if (dpll_filter_parse_enum(dpll, "mode",
@@ -1421,7 +1427,7 @@ static int cmd_device_id_get(struct dpll *dpll)
 				return -EINVAL;
 			}
 			if (str_to_dpll_type(str, &val)) {
-				pr_err("invalid type: %s (use pps/eec)\n", str);
+				pr_err("invalid type: %s (use " DPLL_TYPE_NAMES ")\n", str);
 				return -EINVAL;
 			}
 			mnl_attr_put_u32(nlh, DPLL_A_TYPE, val);
diff --git a/man/man8/dpll.8 b/man/man8/dpll.8
index 84c21e7980eb2b..c1d4a75e072dc8 100644
--- a/man/man8/dpll.8
+++ b/man/man8/dpll.8
@@ -101,7 +101,7 @@ Show only devices with the specified 64-bit clock identifier.
 .TP
 .BI type " TYPE"
 Show only devices of the specified type:
-.BR pps " or " eec .
+.BR pps ", " eec " or " generic .
 
 .TP
 .BI mode " MODE"
@@ -133,7 +133,7 @@ Clock quality level (if supported)
 .IP \[bu]
 Temperature (if supported)
 .IP \[bu]
-Type (PPS or EEC)
+Type (PPS, EEC or generic)
 .IP \[bu]
 Supported modes
 .IP \[bu]
@@ -198,7 +198,7 @@ Kernel module name.
 .TP
 .BI type " TYPE"
 Device type:
-.BR pps " or " eec .
+.BR pps ", " eec " or " generic .
 
 .SH PIN COMMANDS
 
-- 
2.56.1

