Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683935;
	b=jbph4dU3tIrj5CmD/DD7byTF6GgIpoi30eALOioUGuoQvjJR5YK12ekpgHXUFqROfirr
	 6rDcGs4DQHVXuIprstBv88F5pj0R5Bxud5UO5DGxBaltnHaYY1z9szTkDtO6HbvHcooNs
	 8TsriQg1R5Zn8N1lZ4caxv+g/Lh54495cIj0TuyA2Us0q/4Kd9v6X0lHDD8BzcsMNw6D6
	 nT9P+m8xRGxiCvgVHz7mjizkeJ/2+p0i1U/Q23ImSOEw80OYiA/Z8Y8fBksN7Gmv4Rvet
	 BLeo7Lzh5+IqzRsKWPPGC0cDP8vlshKxCVcNGkLjgrynjKO681V/PEHSa6Y2jFn5IDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683935;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=2mntbRCHsv/dMpkoUteTsBXBsm6DpuPwGWgbgL3FMQc=;
	b=0YVlyop4Kulr3htjdmkatc6KnBRJg3FLOCuFQwZSg3ByhQtTBBX2bHLTH++1C6yC/84f
	 fyleBrXSC0wb+0I8MRoDopC6xJKApX9YLLanzcfV32mjytTbke0tIdAC65TdYnen40ISF
	 peffwz+I6wH8eFKf+Gg5Wwku85yYOImjcWjPMoZfYkgkFj4YT3wTKwH0sH2Upqige1M3F
	 Ch0RZyqkZmjb5rSxoAh0/qrXIChoqQzGDFRWbGFs7LTv771AfeU6Gt1nlF6QS7HXflxbC
	 1NrbTR0ednKoFPBn488fMc3PUM1tBg0ocSCGoFjuTReiWy3IvZ3QUI4f2jHlfz0Rm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cFfsw6Qi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133C606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B133C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cFfsw6Qi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795683933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2mntbRCHsv/dMpkoUteTsBXBsm6DpuPwGWgbgL3FMQc=;
	b=cFfsw6QimaI5xzIBoC6OJHSpfC8vozPbX+u6kIg7TvuGK8DZwYbLCJMhiNagKMc2wVk9sw
	sFybbdEbCInnhMEKZ9o5a+QV9g86Fh0gqNwSHvafEzdaq3YYRCMPFE5Mq2QbKML0wKcuEr
	AOGc8ApKD9IF48h5k5RXcwfUKzfySHE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-33rf2YusN3axwF6Fz8jrug-1; Thu,
 26 Nov 2026 09:05:29 +0000
X-MC-Unique: 33rf2YusN3axwF6Fz8jrug-1
X-Mimecast-MFC-AGG-ID: 33rf2YusN3axwF6Fz8jrug_1795683928
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88FE71955E97;
	Thu, 26 Nov 2026 09:05:28 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D627441F;
	Thu, 26 Nov 2026 09:05:24 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH iproute2-next 1/3] dpll: add the int-nco pin type
Date: Thu, 26 Nov 2026 10:05:10 +0100
Message-ID: <20261126090516.4278-2-poros@redhat.com>
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

DPLL_PIN_TYPE_INT_NCO is the kernel pin type of the virtual pin that
represents the NCO mode of a DPLL, and the zl3073x driver registers such
a pin. The uapi header in iproute2 already has the value, but the tool
has no name for it. The pin is shown with "type: unknown" and "type
int-nco" is refused both as a filter of "dpll pin show" and as an
argument of "dpll pin id-get".

Add the name to the pin type map, to the man page and to the bash
completion. The list of type names used by the two error messages moves
to a macro, so that it is kept in one place and the lines that print it
stay within 100 columns.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 bash-completion/dpll | 4 ++--
 dpll/dpll.c          | 8 +++++---
 man/man8/dpll.8      | 6 +++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/bash-completion/dpll b/bash-completion/dpll
index 8b11f8d0c34fad..cfd39c5e0c7a53 100644
--- a/bash-completion/dpll
+++ b/bash-completion/dpll
@@ -178,7 +178,7 @@ _dpll_pin()
                     ;;
                 type)
                     COMPREPLY=( $( compgen -W "mux ext synce-eth-port \
-                        int-oscillator gnss" -- "$cur" ) )
+                        int-oscillator gnss int-nco" -- "$cur" ) )
                     return 0
                     ;;
                 direction)
@@ -279,7 +279,7 @@ _dpll_pin()
                     ;;
                 type)
                     COMPREPLY=( $( compgen -W "mux ext synce-eth-port \
-                        int-oscillator gnss" -- "$cur" ) )
+                        int-oscillator gnss int-nco" -- "$cur" ) )
                     return 0
                     ;;
                 *)
diff --git a/dpll/dpll.c b/dpll/dpll.c
index 5828e78f738eac..a0a5e3f9a2f152 100644
--- a/dpll/dpll.c
+++ b/dpll/dpll.c
@@ -78,11 +78,14 @@ static struct str_num_map pin_type_map[] = {
 	{ .str = "synce-eth-port", .num = DPLL_PIN_TYPE_SYNCE_ETH_PORT },
 	{ .str = "int-oscillator", .num = DPLL_PIN_TYPE_INT_OSCILLATOR },
 	{ .str = "gnss", .num = DPLL_PIN_TYPE_GNSS },
+	{ .str = "int-nco", .num = DPLL_PIN_TYPE_INT_NCO },
 	{
 		.str = NULL,
 	},
 };
 
+#define DPLL_PIN_TYPE_NAMES "mux/ext/synce-eth-port/int-oscillator/gnss/int-nco"
+
 static struct str_num_map pin_direction_map[] = {
 	{ .str = "input", .num = DPLL_PIN_DIRECTION_INPUT },
 	{ .str = "output", .num = DPLL_PIN_DIRECTION_OUTPUT },
@@ -253,8 +256,7 @@ static int dpll_parse_pin_type(struct dpll *dpll, __u32 *type)
 	const char *str = dpll_argv(dpll);
 
 	if (str_to_dpll_pin_type(str, type)) {
-		pr_err("invalid type: %s (use mux/ext/synce-eth-port/int-oscillator/gnss)\n",
-		       str);
+		pr_err("invalid type: %s (use " DPLL_PIN_TYPE_NAMES ")\n", str);
 		return -EINVAL;
 	}
 	dpll_arg_inc(dpll);
@@ -2052,7 +2054,7 @@ static int cmd_pin_show(struct dpll *dpll)
 						   &filter.present,
 						   DPLL_FILTER_PIN_TYPE,
 						   str_to_dpll_pin_type,
-						   "mux/ext/synce-eth-port/int-oscillator/gnss"))
+						   DPLL_PIN_TYPE_NAMES))
 				return -EINVAL;
 		} else if (dpll_argv_match(dpll, "direction")) {
 			if (dpll_filter_parse_enum(dpll, "direction",
diff --git a/man/man8/dpll.8 b/man/man8/dpll.8
index 92d4ead0010bc6..84c21e7980eb2b 100644
--- a/man/man8/dpll.8
+++ b/man/man8/dpll.8
@@ -245,7 +245,7 @@ Show only pins with the specified package label.
 .TP
 .BI type " TYPE"
 Show only pins of the specified type:
-.BR mux ", " ext ", " synce-eth-port ", " int-oscillator ", " gnss .
+.BR mux ", " ext ", " synce-eth-port ", " int-oscillator ", " gnss ", " int-nco .
 
 .TP
 .BI direction " DIR"
@@ -288,7 +288,7 @@ Panel label
 .IP \[bu]
 Package label
 .IP \[bu]
-Pin type (mux, ext, synce-eth-port, int-oscillator, gnss)
+Pin type (mux, ext, synce-eth-port, int-oscillator, gnss, int-nco)
 .IP \[bu]
 Configured frequency and supported frequency ranges
 .IP \[bu]
@@ -384,7 +384,7 @@ Filter by package label.
 .TP
 .BI type " TYPE"
 Filter by pin type:
-.BR mux ", " ext ", " synce-eth-port ", " int-oscillator ", " gnss .
+.BR mux ", " ext ", " synce-eth-port ", " int-oscillator ", " gnss ", " int-nco .
 
 .SH MONITOR COMMAND
 
-- 
2.56.1

