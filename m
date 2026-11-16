Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.71.1.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827809;
	b=CKBjrQSQIFySMiq03K1pF5qfHQTuYYjHfRxJVoUZSvrTTkRzUuRRb+T7RIuujqmvhn6X
	 U2ttY9J/qOHiNoxB8M0z8TGvqClhaKL1NQizF5Dr3DRJupOk+8iQb+/Iz2HDd0NYGlgQq
	 EFaKRR/nKEVlvXNeZ4HzKkviOB+IS61unSRWbnZ62kPyJi5FVreqdAzE6AO5xEY5xOmj4
	 ms+AQ6ZayEETEz9/Fu37YBNjeY08/9F1s0zjIv6XmpNUzLphBJz7HUQTzxqP1w69p8NrY
	 a2bHotCISq1gkZHZ5Hf38Vh6jgoRsfy4eUi6NTSRvKfl+kNy6gcpR/FLOruqOHYB04g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827809;
	h=DMARC-Filter:Received:X-Barracuda-Envelope-From:
	 X-Barracuda-Effective-Source-IP:X-Barracuda-Apparent-Source-IP:
	 Received:DKIM-Signature:From:To:Cc:Subject:Date:X-ASG-Orig-Subj:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Barracuda-Connect:X-Barracuda-Start-Time:
	 X-Barracuda-Encrypted:X-Barracuda-URL:X-Virus-Scanned:
	 X-Barracuda-Scan-Msg-Size:X-Barracuda-BRTS-Status:X-ASG-Debug-ID:
	 X-Barracuda-Spam-Score:X-Barracuda-Spam-Status:
	 X-Barracuda-Spam-Report;
	bh=5nOHcpNhLoBWy628z8/HvgDFWDpbLjNPeDcq32z054I=;
	b=kn6pSi2D9wVoUup+ORABpYGtjBnW5qcu5aYF356cM9gbCUJXktpmyuqqqzmV+qaiL2Ab
	 h/2hdf+j+sk/7W3jDX7yddRLkkjkgECJP/ne5fPGk9DemgfoDF5xRxg05svHB/9OLHBuG
	 AgMb+CRZBF+EpO3WzdpwvWJWkb2nSv3wwEO6Fyql7O26i+zdpweaAcD6B7WnWR+2tXAOJ
	 lotEDEx1bh45cwKztP25gcrWF/sQMfA8GfxCL5YWqRw6wbxmB0iwJauPEgLIPYpL+Nmkc
	 NZ7wdSUBbxW7ITGOTv8R3X0QHsISf6QxvvIb+rJYrk2TlmQjsdzmUZk1V7Edh85xCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vandijck-laurijssen.be;
	spf=pass smtp.mailfrom=vandijck-laurijssen.be;
	dkim=pass header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=THgJCoYp;
	arc=none smtp.remote-ip=212.71.1.222
Received: from relay-b02.edpnet.be (relay-b02.edpnet.be [212.71.1.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D715606E4A0
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D715606E4A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vandijck-laurijssen.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be header.a=rsa-sha256 header.s=default header.b=THgJCoYp
Received: from srv21.vandijck-laurijssen.be ([213.219.153.140]) by relay-b02.edpnet.be with ESMTP id Xy6rxl87sa6w9Yvf (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO) for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:16:47 +0100 (CET)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: UNKNOWN[213.219.153.140]
X-Barracuda-Apparent-Source-IP: 213.219.153.140
Received: from fwg.vandijck-laurijssen.be (fwg.vandijck-laurijssen.be [IPv6:fd01::dab3:2fff:febd:d001])
	by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 0EF0AB27318;
	Mon, 16 Nov 2026 12:16:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=vandijck-laurijssen.be; s=default; t=1794827807;
	bh=WEJ1CW39ejNVw5g4Q84t5BnwUy6yX+pB38w44uVTzLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=THgJCoYpFSHEMPykGVr1ld9sgAiyoFp4gkvVx50BsoPscOt3qkLwINxpyp0Xp0jRO
	 ZhiX/E3BFG4Pg7uUgHSMyUnLoT+iN4v+nalioPIrvtLv1AVV1TejBit7kgIOeQt6dt
	 YHo6y/JaVvV7uismwW/XZJWKSYP1tyI39m1EnwooTPTP+U/t0NaCbPTNGYx2RS0Vw/
	 ZZkqtQS7/H6MPtbLFfDSTF8vhzA3lcZMPtlds66NeR9bhmjXa8UKOAntndLySuq+/0
	 63dlKPV6/WVn9kJ/BcNjS0ku8sSYsTsAdxExOHURkk0XwpjSieeOkWu9k58W+PShOw
	 7spszDBwW+TMA==
From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To: netdev@vger.kernel.org
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH iproute2 1/2] ip address: allow labeled proto arguments
Date: Mon, 16 Nov 2026 12:09:38 +0100
X-ASG-Orig-Subj: [PATCH iproute2 1/2] ip address: allow labeled proto arguments
Message-ID: <20261116111613.25820-2-dev.kurt@vandijck-laurijssen.be>
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
X-Barracuda-Start-Time: 1794827807
X-Barracuda-Encrypted: TLS_AES_256_GCM_SHA384
X-Barracuda-URL: https://212.71.1.222:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 716
X-Barracuda-BRTS-Status: 1
X-ASG-Debug-ID: 1794827807-214fdf6fb71357e0001-BZBGGp
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=10.0 QUARANTINE_LEVEL=10.0 KILL_LEVEL=7.0 test= 
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.125474
	Rule breakdown below
	  pts rule name              description
	 ---- ---------------------- --------------------------------------------------
	

'ip address add' allows to use labels from rt_addrproto table.
Allow 'ip address list' to use the same list.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 ip/ipaddress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ip/ipaddress.c b/ip/ipaddress.c
index ff85792f..e9d9c2e5 100644
--- a/ip/ipaddress.c
+++ b/ip/ipaddress.c
@@ -2231,7 +2231,7 @@ static int ipaddr_list_flush_or_save(int argc, char **argv, int action)
 			__u8 proto;
 
 			NEXT_ARG();
-			if (get_u8(&proto, *argv, 0))
+			if (rtnl_addrprot_a2n(&proto, *argv))
 				invarg("\"proto\" value is invalid\n", *argv);
 			filter.have_proto = true;
 			filter.proto = proto;
-- 
2.55.0

