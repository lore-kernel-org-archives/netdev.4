Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556680;
	b=dRMD38Bx/eq3FwNn5e2KMFvmfiRmwqQfZ+Fh8wu1eqwEcZ5T4GRGgxzvSwvDtGM6h5Zr
	 VRvIQZ7o6aCdTr8pcYlhRnHnSPUosU5dcDKFf2u/vcU7TNQoGWHZoX6oED0mo3IQfoq1Y
	 kTdLsM5rdLHHtZEcMvSiooc7hojV6ZmOFQy40ysOrFsigBc3l75wqKX4HsGyJiLBzZjV2
	 My47GoUoAwQlUCy6DYyjaDsVnNcvDAQCcdRYFrjMzoqMDAK0O91c3COAWJjQl7K5Cgvag
	 9GzbAk5SBPUb8Q+1rKXZcayxSUJgprAx0cPswql315ivCL3p6nyzD8R7ZyATF2XUxjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Subject:From:To:Cc:
	 Date:Message-ID:In-Reply-To:References:User-Agent:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hBW/G9C70lPcY4QdZymNFNrVfaLzpe7u/fWPklcGwqw=;
	b=g0Nb+YFvnaaLEYzo8kXZjXhywMnpXjK8vDgvlt6hrEYi9h+5DnOYNwqQldAhoDKlRDbq
	 /exOqhl1aSWzCaInMtO9iiVlJtWfpnRXSGCcJsWyIIL7L8jNny2uCYHyHwaCzqJgpmKzB
	 VrmHQzEQ4F2kN8dj5TS1dvWwo3xvslzs1dPRGCtOWwGdLkigfjFTLHI+Ah6pbh6mBMJFA
	 6cmYrYjjWRRRLXqtxTOXLqLaPtbH1WpdxZpgGiL8EovxNKFs7iEhYtW8JgSL3efV17siU
	 UZvB9zjbyheePgaFs12p3vPBWSEF/eLRaAI5bIOK1hXX9X89hNRxmuXVBWBL4LIei9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iu8hUdi+;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CA2606A339
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CA2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iu8hUdi+
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso3457652a91.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556676; x=1796161476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hBW/G9C70lPcY4QdZymNFNrVfaLzpe7u/fWPklcGwqw=;
        b=Iu8hUdi+m0sW9FvVWhwh4vCqIqaDGLYolAtupT44r5swG4crl4drhmT4CKHOqH9n0v
         pXRQS6SEyZw7kGEKAfE3sxO0VPZ4Erq0YxlAIwgeo4nFhyK9ujf2b7ght0gAW4vi7LGs
         ik1xEVR5vI8v64WuhMiAvo0s+L4z1fwb00rdqN8vur1lUE0myZ/EqE2x+ZgzuOAdUpxK
         C9CxjPHkBwFLuGQSS5xcwCyh69tLdIkO8caGl8MRswsBkXTd9L+8gFHjyXbwwDfw5TJL
         3fW6OIY8vRysOx/zgC69lPF2jUUmOiFeXi935rA8Fen60dU31Nbj4tI1rNJE5Y0iTwhM
         syYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556676; x=1796161476;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBW/G9C70lPcY4QdZymNFNrVfaLzpe7u/fWPklcGwqw=;
        b=TXDSk4kPttSLTcmGb5N3emmbcYBdeEiC9u6oyYvLR2whjfAWOGETfYhrX3fNXddveT
         YnIDZs7EEBIICq2y/eSmfH5xU+xVCO6dFdbs6jL8DjTJeGEFeiyX9ChZrD3xpaVZ2yi6
         YPywouZIQKqzvFqbsXsZMz7O/z+Qak/wZ9sx03+f6xnusOr1TZnzFBJ6l3RD/Q+Ui6um
         iNcgAjanDiScmT1JnGQuHMmPhctt1kry6Qe0R9+LJWyzAkPV9RYTPsghizYYOcZBzdh7
         kw08l/KJMe6InuCJ/ca2hws3fBb1aACMDwBsytxeFne8nmvNGXpBaPDVxLFd/AMR5oPD
         Nr9g==
X-Gm-Message-State: APuU4Z/RgGsAo6gQmdw6iMxQCBZazdw5R2lvQ2xv6L4tOkVKKkJJC2ra
	q0WRxAFJnxBIJQmEHvLX4s7juTP1kKeyfLw1AMM2wRMvuEN+3welgVFQ
X-Gm-Gg: AZFdTZfDg1gIog4tzp2KTmDAMj8rBLBnCqRMZ5x8iJp+W0P09Dn8JvcsCCpU7fooDnR
	2PKN8FkYRKD0t4jFh1vZimwHkGZBlrAYLYAO7PazEpg7C+T8LDyoTnQ8VhDYgFoxHF0LvEsSqtf
	KsboW7YsuZGRJ+Gu0yyIfKQa/28OZJQCaPdNmn53dVr84wyQJHyPDhlBD3RK7WdspnpB+Nww0bI
	MmU40irbmM6xKVfW84PYZ1DmbKvAPIUbS+pacAoBdy7u97TExSq3oIqoVxBPG8ujB8Y9zLZpYYd
	UITvm9+Jt9FobZNO/7zyqFG9R4T+R2t800O6imNlEA0Br78DpmDVb3Q86zS1rAVyITvbxUqY8uf
	7kd9j/tZANBvnDzhY/Sxj4O9UOIG1xIT9rmsxjr8jCgywojnL1wVaQDfBoXMN9FjUNAtLshHIRQ
	ct1udjlix88O8PFmCPV+oEinM4ylTsHiS6nyv/YQRBUujGcnZPTtggsh6/8mfFXb8o+sTVSk5Om
	ghkjLYhhMgtV7Kp6N7u0Lb6oOjtrRq3p4NEXWPrkek6iEsSfuIeV+vJpeD4OGOxTCyY9AJDCt81
	1gGJFuHBqeQjCvNsJ/SGJnMiAI+6vVR5Lvurm61g+su/hCXcVS4UDYdBpYY0KKXLDW68LLlpMMG
	wsOl/xtA6/CR4IWL94xj+s0RPgeiakK5I//umcd1iiZUHGA==
X-Received: by 2002:a17:90b:2688:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3b41c97ab4emr14117033a91.51.1795556676472;
        Tue, 24 Nov 2026 13:44:36 -0800 (PST)
Received: from ahduyck-xeon-server.home.arpa ([2605:59c1:38c:400:22f5:2de:b9c3:f27c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm26974510a91.14.2026.11.24.13.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:44:35 -0800 (PST)
Subject: [net PATCH 2/3] fbnic: Do not report a FW coredump info error as a
 parse failure
From: Alexander Duyck <alexander.duyck@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 13:44:33 -0800
Message-ID: 
 <179555667294.7867.14016739586914876839.stgit@ahduyck-xeon-server.home.arpa>
In-Reply-To: 
 <179555657536.7867.497419917946087787.stgit@ahduyck-xeon-server.home.arpa>
References: 
 <179555657536.7867.497419917946087787.stgit@ahduyck-xeon-server.home.arpa>
User-Agent: StGit/1.5
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Alexander Duyck <alexanderduyck@fb.com>

The coredump info response handler returns the error the FW reports, or
-ENOENT when no coredump is available. The mailbox Rx path treats any
error from a handler as a message it could not process, and logs a
warning with a hex dump of the message.

The error is already passed to the waiting request through the
completion. Return 0 once the completion is filled in, as the TSENE
and FW upgrade response handlers do.

Fixes: 5df1d0a08483 ("eth: fbnic: support FW communication for core dump")
Signed-off-by: Alexander Duyck <alexanderduyck@fb.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index e00d626f6438..9a3df3767442 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -960,7 +960,7 @@ fbnic_fw_parse_coredump_info_resp(void *opaque, struct fbnic_tlv_msg **results)
 	complete(&cmpl_data->done);
 	fbnic_fw_put_cmpl(cmpl_data);
 
-	return err;
+	return 0;
 }
 
 /**


