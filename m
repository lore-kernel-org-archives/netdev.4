Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.71.1.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827836;
	b=NrFfR9EDJp4ZK6c0cCrxEh913rl2MoR3zAxCw5k2h4J1obgUX8nEg7rH6TdMzuEboW4R
	 zID6oTi4LUjJD98V+pH7u721eIfkilN9KBxA2wJt8PcEFApPpu2N6kiPUtFutx7Ow9bpr
	 /yWThqMGxVi/82LPOPbEUpAg8XSU/vpbB9fqEoNTYH1y5t9j29inzMihGNwbCc6mcLeWi
	 psCzHJ/82qGO7oopUCgJltPYyUIn88vEZT1y/r7wGSoyauTVZgWduRYWw3R+7vcQTxCAi
	 eGofXIQhJ63L1IsywchR6Bol68aanaKp0c1echOBmg1j1WTz57FdJQy2eiKNANT8kgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827836;
	h=DMARC-Filter:Received:X-Barracuda-Envelope-From:
	 X-Barracuda-Effective-Source-IP:X-Barracuda-Apparent-Source-IP:
	 Received:DKIM-Signature:From:To:Cc:Subject:Date:X-ASG-Orig-Subj:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Barracuda-Connect:X-Barracuda-Start-Time:
	 X-Barracuda-Encrypted:X-Barracuda-URL:X-Virus-Scanned:
	 X-Barracuda-Scan-Msg-Size:X-Barracuda-BRTS-Status:X-ASG-Debug-ID:
	 X-Barracuda-Spam-Score:X-Barracuda-Spam-Status:
	 X-Barracuda-Spam-Report;
	bh=IEjr7RsBskrOZOoY2K/Gxnp5N5gt5SvIzc7TSSFW5g8=;
	b=kNXE0P+Zp7qOdjB/gt76ujsWSTFlfkYqrVyvSWcX44mzoceDZRse/fWejRC996JWEX1T
	 jWY/1++suD8hDhE2cLrP3FEMxfBBA0q+Rz4ZXt72H1Eg2/pofuGLkJSqnR9b10ribN7GW
	 +pyrTVFOV9wXjgTOCajIpnBvUz06VmdbOgRHZWVilbyU24BQxvYMiOBvEsCkAxn8HuOZb
	 ZdzDYJXtejWwIqFgSuzcBkWAgTD+MiEtDjSvrj2z/wifYh51fw1eEKhHieugb9Z/m1DYJ
	 T6lHD63JZkP2jBnMAsjIkXPfriLV+J1STMTRDXkUjywhGvd5Yp6vjzQqPRg6XoVvEIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vandijck-laurijssen.be;
	spf=pass smtp.mailfrom=vandijck-laurijssen.be;
	dkim=pass header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=XAX7VRik;
	arc=none smtp.remote-ip=212.71.1.222
Received: from relay-b02.edpnet.be (relay-b02.edpnet.be [212.71.1.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBE0606A339
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CBE0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=XAX7VRik
Received: from srv21.vandijck-laurijssen.be ([213.219.153.140]) by relay-b02.edpnet.be with ESMTP id vjy4duf5Uw8zjRJ4 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO) for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:17:14 +0100 (CET)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: UNKNOWN[213.219.153.140]
X-Barracuda-Apparent-Source-IP: 213.219.153.140
Received: from fwg.vandijck-laurijssen.be (fwg.vandijck-laurijssen.be [IPv6:fd01::dab3:2fff:febd:d001])
	by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id C1FE9B2731B;
	Mon, 16 Nov 2026 12:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=vandijck-laurijssen.be; s=default; t=1794827833;
	bh=dFgbG0brf4AsT/ZBXfPaJfo896fI+NRB5Zdwckx32hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAX7VRik04pALD46nKYII8p+6aMqQDas36iBe0lTBDW87c/37sOu5l6xqLw3nAtRc
	 TjgJSk8Ed1aiXE7+byto82ammmLsOeZdd91MMN9smo2KOOsGgyT03IjdDXkr8U4JEs
	 DhE8m36LLhm9F/X0/Ix3VOmWQHh2HncIchKriXAEOTmDDWxCGFDXp6aJC7RMUvyr2V
	 0pNNfbV8bGRdynki+xULYfUo7Kmuou/BppO7p/z6ZGSaJSDwjvuQT4GDHeY0YpBd0o
	 CB8FjzcWGhumGf7FB5o/75VopweEMfBgZZ/MiWEQzn1bdoQpMEFM8hrrlTKW7Odnm5
	 iAcvvwyqo9Vhg==
From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To: netdev@vger.kernel.org
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH iproute2 2/2] ip address: proto filters rejects items without proto
Date: Mon, 16 Nov 2026 12:09:40 +0100
X-ASG-Orig-Subj: [PATCH iproute2 2/2] ip address: proto filters rejects items without proto
Message-ID: <20261116111613.25820-4-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116111613.25820-1-dev.kurt@vandijck-laurijssen.be>
References: <20261116111613.25820-1-dev.kurt@vandijck-laurijssen.be>
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
X-Barracuda-Connect: UNKNOWN[213.219.153.140]
X-Barracuda-Start-Time: 1794827834
X-Barracuda-Encrypted: TLS_AES_256_GCM_SHA384
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 2064
X-Barracuda-BRTS-Status: 1
X-ASG-Debug-ID: 1794827833-214fdf6fb4135a00001-BZBGGp
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=10.0 QUARANTINE_LEVEL=10.0 KILL_LEVEL=7.0 test= 
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.125474
	Rule breakdown below
	  pts rule name              description
	 ---- ---------------------- --------------------------------------------------
	

When selecting addresses with 'proto <VALUE>',
treat addresses without a proto value as IFAPROT_UNSPEC.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 ip/ipaddress.c           | 19 ++++++++++++++++---
 man/man8/ip-address.8.in |  5 +++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/ip/ipaddress.c b/ip/ipaddress.c
index e9d9c2e5..4a4a87d9 100644
--- a/ip/ipaddress.c
+++ b/ip/ipaddress.c
@@ -1542,9 +1542,13 @@ int print_addrinfo(struct nlmsghdr *n, void *arg)
 
 	if (filter.family && filter.family != ifa->ifa_family)
 		return 0;
-	if (filter.have_proto && rta_tb[IFA_PROTO] &&
-	    filter.proto != rta_getattr_u8(rta_tb[IFA_PROTO]))
-		return 0;
+	if (filter.have_proto) {
+		__u8 proto = rta_tb[IFA_PROTO] ?
+			rta_getattr_u8(rta_tb[IFA_PROTO]) : IFAPROT_UNSPEC;
+
+		if (filter.proto != proto)
+			return 0;
+	}
 
 	if (ifa_label_match_rta(ifa->ifa_index, rta_tb[IFA_LABEL]))
 		return 0;
@@ -1929,6 +1933,15 @@ static void ipaddr_filter(struct nlmsg_chain *linfo, struct nlmsg_chain *ainfo)
 			if ((filter.flags ^ ifa_flags) & filter.flagmask)
 				continue;
 
+			if (filter.have_proto) {
+				__u8 proto = tb[IFA_PROTO] ?
+					rta_getattr_u8(tb[IFA_PROTO]) :
+					IFAPROT_UNSPEC;
+
+				if (filter.proto != proto)
+					continue;
+			}
+
 			if (ifa_label_match_rta(ifa->ifa_index, tb[IFA_LABEL]))
 				continue;
 
diff --git a/man/man8/ip-address.8.in b/man/man8/ip-address.8.in
index 79942c1a..55cb7e63 100644
--- a/man/man8/ip-address.8.in
+++ b/man/man8/ip-address.8.in
@@ -449,8 +449,9 @@ This is an alias for
 
 .TP
 .BI proto " ADDRPROTO"
-Only show addresses with a given protocol, or those for which the kernel
-response did not include protocol. See the corresponding argument to
+Only show addresses with a given protocol. Addresses for which the kernel
+response did not include protocol are considered to have protocol 0. See the
+corresponding argument to
 .B ip address add
 for details about address protocols.
 
-- 
2.55.0

