Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953744;
	b=Yb75JEgMjl9B7W0onVpxW1ypayvWk7weqVgbxZhJQdcigKlnfkXL4g+YpONjbuIYj8bb
	 cmvJIUqsjasF4SdVxaGuNAy4PNHAbJN/v6FddfZmv66ReMbRGKMJaBpmxB1hbqsFvaSG1
	 caRXVUfC5FgEQLmqMFrMgECntW1amZaXfNmYiDNvEaH67MJXzPS7El6m1Xn+2sRFGPeMn
	 u3pnvEA2iFJAb7oyrP4edizvvcpISpiSNN/+I9WrYoViIE1Dnod6KhzwmPxfjjjbX+lea
	 c8Vwdx3kX0ahRwZorqcR7egOdKcxe5qPCSaSTEA6viB21o6Str1wYPjNpqfmQSp3pGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4aMMFkXBmhDNbkMddHOYmKs1ldPvaFgEp/CTY5zVmKE=;
	b=ZAJwAKR4GyaPteDni35l6hiL3vyztvYOP1CoCGeFHSbRJ1YVhJWKkjmGER233AHRdxxa
	 9gzKCVtRuB0ST6Nm1SrSxfiVj91K7UqdCw8zwlkjx+XD6gLwgYJc0SipG7/EmYgPhqQQj
	 JrSeg1ha/8nDDxZS3pEFbf5TBtdgVsSaEaZK0oYA1wq/uoaDQbYqYHSJ3ltI3odPVxPQY
	 1HgcHciVE7u5APyFef0x/OuQPXmXEVtI/txIcti7fc9Miy+znM9zesvNpsl7DQ/GVroh+
	 QOLA7nhwffImIW3oSvQa19W5/vS0wLvfJxjDDXPKbi079ed+lHrDx2yyO/grv18DUNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iLzZAJv4;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF685606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF685606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iLzZAJv4
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e987a2ba0cso2083995ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794953743; x=1795558543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aMMFkXBmhDNbkMddHOYmKs1ldPvaFgEp/CTY5zVmKE=;
        b=iLzZAJv4uBcQGjiU0dI/Vsw4/dmlRf4at12apEjV4V6j0aVpQG0bh7yrpkDAr6Ui5/
         i5GuYcg60UhpYMTsWZiSROyIKDeQleH9TJqFeGpbaZo5fRHm6xn8GrX7zdCtROmbUKCT
         o/ZWHqCmNML6o30xb+6UgxPPZp+hgRH99Va5I6c+AoGj5fj93cYZaAImzj4LWxmF2Ebi
         kZykwj8q8Baq9NfsbVDT5L59kFxDAlNd1ZKsWA+sbxTYMka3w0jPuiYqgZT0z1WnaqU5
         ZO+f32Pn/YtPv6p+t7UmfBQ6HWdRY52DnvSLF2EiT0XSQq00Px6OEw7GOD7huiSIcwEM
         LbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953743; x=1795558543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aMMFkXBmhDNbkMddHOYmKs1ldPvaFgEp/CTY5zVmKE=;
        b=WhHxdXWAoiE0aCqzzYudChUa2GrPKBCoNm4vwgzbJZAU6Et3CJiGVmYgpc5mOPwaEZ
         pCoJgDarx/I2QOrRBmAkTVeSnt9sTuEHZIjcgun+G929Y4Wtg9baEkCQJkP7xCJ3cxoD
         GqY/x6vu2d1yCaaz0nMfvcbZEttpj4zf+AaKGLBc0c3Tq0VdvijTTRQggCnJb+mqMo37
         qnjAD2PbGo92ih4fwFLP4RVXlNWRJpwP0DptSG6Y/pU3gcXMUom5PfLSL5RFPOXga2iH
         /nkuP6AfLsJg/TtFZJe5Mr2HkiztL4ML39MF29H0gI3I61uh1gsN/esHWbOoYDWIsRfW
         sKjw==
X-Gm-Message-State: APuU4Z87Y2RUEVprNWCeC6ZGzsyO6mbkIMQF2RGLrkx4h8sX4fiid9b6
	DP9OwE+wvn160XKszCpojwh0c8zJoP2LlSypqS9y1ZLofaWaHdOrpcFwez7yFtwRsh1TA7hEuLf
	fV9wGt+Q=
X-Gm-Gg: AZFdTZcfmobI8QGbP8z5opi8WKJY2C91qyquJkhvrvquTH4UvuafhGmWvOuJ8ubq0k3
	Rw5XC6FDh3om+GOtw5jXqdeaM/xojUKlyl0Y9IJ1eIcWKo4n0cpbrwu2Q5S4an27juhCX01ekQS
	QYAaQHF39nnRGbkMYHS+wCDF5GjNQgpNd3384mvCPpfoSHwu18scJQCaHlQkcOUwPfYL+lC5A4M
	Yi0FF9lFC9Wp8VIBhcRcLH1Em4U/OzD2WzNC+Tcw8qotb48wN4d8R9Ar6evNGIhYNzZ/YZIYZYE
	cwD9r0eCcrIefpbxxEGfw20NZYC9verJGUvE8KK3d/i4DsKsKKq1cimtLoF1WFFbZAEgoxDVGzW
	il1PK9yfELGelqTjx4ttDyKqzn6+eLyeIV6gfYQXnjyzjFHhEDWijDoyQAkX8JWkCg4M/YX2s4t
	sINhYzyGVrWbKBmBXg/ScV66mpGTFBU1DUtorZsd6F4o6l9jyq4qt+ZUBiNg+0OQB81oU9iHGxD
	mOcuDXLOPFt8DnfoPnKygHrZV49HvkIizPKantSveRbQrNI7tbagcscCTtohoCfgsRLBmWDN0JB
	BayJ/tb9GCmVZaJikx6G6NV/tGZ6P0/CZR8YGhPBp6V/wIvhSlkFUn4doYShgnJXW38L3QO4mvJ
	xJCKkx3Stzp7MnA==
X-Received: by 2002:a17:90b:4488:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b3d07d5320mr718689a91.67.1794953743438;
        Tue, 17 Nov 2026 14:15:43 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm38067a91.0.2026.11.17.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:42 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3 1/3] rtnetlink: return EMSGSIZE when first dump entry does not fit
Date: Tue, 17 Nov 2026 14:13:42 -0800
Message-ID: <20261117221538.184948-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117221538.184948-1-stephen@networkplumber.org>
References: <20261117221538.184948-1-stephen@networkplumber.org>
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

If a route entry is too large for the dump skb, the dump is silently
truncated and no error is returned.

For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
-EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
dump ends with NLMSG_DONE and status 0, and the remaining entries are
lost.

The first dump skb is allocated from __netlink_dump_start() while
max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
kernel that is under 4000 bytes, and a 500 way multipath route does not
fit:

  ip link add dummy0 type dummy
  ip link set dummy0 up
  ip route add 198.51.100.0/24 table 100 \
        $(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
  ip route show table 100

The dump prints nothing and exits 0

Only ignore -EMSGSIZE when the skb has data, so that an entry which
does not fit in an empty skb reports the error to user space.

This only covers handlers which report a too large entry with
-EMSGSIZE, such as the IPv4 FIB dump. inet6_dump_fib() instead returns
a positive value when the first route does not fit, so the check added
here never fires for it; that case is fixed by the next patch in this
series.

Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/core/rtnetlink.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..2777796a4ed2 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -7043,7 +7043,10 @@ static int rtnl_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
 	 * Some applications which parse netlink manually depend on this.
 	 */
 	if (cb->flags & RTNL_FLAG_DUMP_SPLIT_NLM_DONE) {
-		if (err < 0 && err != -EMSGSIZE)
+		/* -EMSGSIZE with nothing in the skb is an error, as returning
+		 * a length of 0 would end the dump as if it was complete.
+		 */
+		if (err < 0 && (err != -EMSGSIZE || !skb->len))
 			return err;
 		if (!err)
 			cb->data = NULL;
-- 
2.53.0

