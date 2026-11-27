Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762519;
	b=032Tf5B5/pPYPN0o8bPHZwjPIAxjEn38yMads5gImhsHb7mPnl7tSrz93BnXNc8mhyNB
	 6bYtPJfEMHFh1JV/8Dp18+lYggCSBrJyt9pHG0MEDr0EgbxmDJQB4KrZgqQnvqYGK/4QQ
	 KCRt8i97G5yj0UsO5OdywE8wcaaw60vQKYJlLrCf/VjpvQaTSQTpDy+usyNQS1n7anH0b
	 vbuUfRvSqzoRm4KkGgeUCrHDSmSrUVfIFQtIErv1ZII39T/I8C0fM/E+QYyiA/72lCtIR
	 CF66MdPiDIJTThWi0c1N+zwa6BXfEZGZdJLIOuKJH+sozNV7ovYz4xyZKgFh/War6eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=erNRx/pa4ybfvht61Cy5QMsfcLY/xQhwXhQlf25RgsI=;
	b=ZTEPcBCEZOt2m5yCxOHjp9W+MFmazQA4H4roJPjbpsukArqA9n6kYqgHcR1I6J7zhub5
	 NYlqjPmpoCHBl1d7egYrM0yydpKEJOxANiyW6ZEhKcWvDrR/hxip+WaW2dGiaLf1uq1iO
	 5g1g7qbhBuIZeoeKdKlQ6BB+aA+x8K2rA6T85IiL6mLX1Hgu6KJ/D9M+HRxe+2RUtXHKg
	 hN4HkpD383pFf3+7uuWBHahbt5LxJ4aorTiBl9mqX7dW3AAUxVilzY+ZE5kkO47gKZ2OQ
	 SvSwdkMaN7PIveKZ/AdqStueYKgsPCqAVSsxQ5NAGqN5I4lmJjMOyzEONnJ1/1mSJMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xw6a4Wdb;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC7606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EC7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xw6a4Wdb
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2f08b80a840so41953445ad.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762519; x=1796367319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=erNRx/pa4ybfvht61Cy5QMsfcLY/xQhwXhQlf25RgsI=;
        b=Xw6a4WdbBuEohq4yjyZKoO3Y1qKNC6rBR2ZO+XR5X6FRoZhnMgDRDKVx1a+BQp4RHj
         Yy9SJixfy91qcMTmAQVIZTKHvG5A72rknRFllvO5+Zdi3rHQmLcbQciJE9CzpU1AJ0hO
         dyun41/ut8Njp4vByLSGE6fE+8sNxKbOnJgwcffLCkUqIdbc5ENGp2sFWI0L1KUjO+w3
         QBbNqQuHP1GTIL90KSnMaJ4PEkWcbWusKPqxvuCxI0taO/uWECcDfIq20lJ5guSi/muP
         iwwaJiQDPH5AolyhtfATtNPfkFASCQ2ROi9XRq1vgAlKkJLL8tkCMmAIM7JG2nFuvVUT
         fjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762519; x=1796367319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erNRx/pa4ybfvht61Cy5QMsfcLY/xQhwXhQlf25RgsI=;
        b=2pWNRkEgUKndw6I3N0NFioaqDzdKzaDSvQcmhuiYtFvM/CMNvpUZouEF/BiVvhQEPJ
         Pjw1tDc+WCq3LcZQ5x6qrF9Ys6/HjIT9hrRdyxQvNxJGX94LZ8Gvr25kysVtppD4xbbp
         g4rpBn+lp2A9y1PQgiMiXSkSrfvGcGonDgHb9ddP9E93RMCoCnQ0ejhEtgMCqH1imKUx
         mXDSsVFpWDEmZ0RBZE/Lir3FQpR8Z1/bpTZ4bxwhSJ5BSDRPEubJr6rGBhcvPYa/V7O4
         sHeFg52CSMVL+RYBNwA1A0glUZ70wznNRhyjsjoBr9cp5xajsxxlJvK05uQwK90b2Jhq
         Lssw==
X-Forwarded-Encrypted: i=1; AL+hErGRqn5euqVmdzq4zqkY4ZJsi6SrySbrMhZJF/KDzEWraybeA2aqWs5bki+4UhGiUs7z+C+3REs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X9F3c5wt2FHTpLv2NRzdyu8koE6UZq/nrxUQVHts+mPLG1Gif
	+0uTNTPvafjkSn2GOafvHumoYf1fUKxzTsYDuKMsnUMBkM11g/D6zHdj
X-Gm-Gg: AZFdTZfLOiLmdttsM9x0c/9R2b6WtXUqlW6/SA87exCpiawrBV7laR5oKM8ek60LOcF
	iYhQ9yv+PhrK8kgEJAMCWrnE3d28cqROX0DzA5a5ZRDTl40jcGHWL2oicEWpbX9Eq3en2GCP563
	MRcFvUkcI8TueuJDpUY6+Ss1JrtoophVqOXyPHMvHe+egKJDpRIk6iGjl+4uKzyjgxUxI+NBZqP
	aMFzsqK6CN3hJJyMqRSED5JIymVmrnQCCsbTPYaSW7KrmsMughSctMoqK0sSxuTmfNXU1rqmlXW
	WJrEJyVQXy/zly+33rGR+xFkZGY3nafN2YKVEKE7SBpK7cKDIUA6r0+yn9GOhUoHzK93CY27a0N
	M9GMLAhST7E7SxM9q41ueyIDajamvWciPOIzPhxrRdFVmm0i2j19ObAcPp0pPVIh1m7jysoHpWh
	nX1ZyuliWeQNSn1ezWM/ith8P1/hcF6fYB//HhH7Z90zb15Z1iH15KJzywkp5xVVELFgYGYDbVl
	Ti3ZRtiWUltIgX4JmTjnsRUogBNLxFnaPa/XuZTCrUL9geZTSWxU5AjGJqpoSZrd0csmdgbEJnr
	hnkDkVogESrCPbMFr72UV7c9azz9XTKZePj+SVyrD4Seuf0HsABlX+Tejwm4kk4tfDYN5kl+uFA
	I
X-Received: by 2002:a05:6a21:32a6:b0:3fb:3a56:e41b with SMTP id adf61e73a8af0-4014db62821mr29894274637.48.1795762518648;
        Thu, 26 Nov 2026 22:55:18 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b333sm11793302b3a.40.2026.11.26.22.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:18 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Patrick McHardy <kaber@trash.net>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH nf] netfilter: nf_nat_h323: fix UDP mangle offset in set_addr()
Date: Fri, 27 Nov 2026 14:55:09 +0800
Message-ID: <20261127065509.2925843-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.53.0
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

set_addr() unconditionally adds dataoff to the embedded-address offset
before mangling the packet.  That is correct for TCP, where
nf_nat_mangle_tcp_packet() counts match_offset from the TCP header and
dataoff carries the TPKT header length.  For UDP,
nf_nat_mangle_udp_packet() already counts from the UDP payload, which
is where the decoded H.245 data starts, so the extra dataoff shifts the
write past the address.  When the decoded address sits at the end of
the payload, the shifted match_end runs past the skb tail and the
memmove() length in mangle_contents() underflows, turning into a huge
copy that runs off the mapped pages:

e.g. on mainline v7.4-rc4 (KASAN build):

 BUG: unable to handle page fault for address: ffff888140000000
 CPU: 1 UID: 1000 PID: 82 Comm: poc Tainted: G O 7.4.0-rc4 #2
 RIP: 0010:memmove+0x91/0x1c0
 RDX: fffffffffffffffe RSI: ffff88813ffffffe RDI: ffff88813ffffffe
 Call Trace:
  nf_nat_mangle_udp_packet+0x13f/0x420
  set_addr+0x18a/0x830
  nat_rtp_rtcp+0x50e/0x910
  h245_help+0x1eb/0x240
  nf_confirm+0x481/0x8c0
  raw_sendmsg+0x203d/0x2630

Only add dataoff on the TCP path.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: f587de0e2feb ("[NETFILTER]: nf_conntrack/nf_nat: add H.323 helper port")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/ipv4/netfilter/nf_nat_h323.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/netfilter/nf_nat_h323.c b/net/ipv4/netfilter/nf_nat_h323.c
index 6bcd6734769b5..764bfc89027f6 100644
--- a/net/ipv4/netfilter/nf_nat_h323.c
+++ b/net/ipv4/netfilter/nf_nat_h323.c
@@ -35,9 +35,16 @@ static int set_addr(struct sk_buff *skb, unsigned int protoff,
 
 	buf.ip = ip;
 	buf.port = port;
-	addroff += dataoff;
 
 	if (ip_hdr(skb)->protocol == IPPROTO_TCP) {
+		/* nf_nat_mangle_tcp_packet() counts match_offset from the
+		 * TCP header, so move the offset past the TPKT header.
+		 * nf_nat_mangle_udp_packet() already counts from the UDP
+		 * payload, where the decoded data starts; adding dataoff
+		 * there writes past the address and can underflow the
+		 * memmove() length in mangle_contents().
+		 */
+		addroff += dataoff;
 		if (!nf_nat_mangle_tcp_packet(skb, ct, ctinfo,
 					      protoff, addroff, sizeof(buf),
 					      (char *) &buf, sizeof(buf))) {
-- 
2.39.5

