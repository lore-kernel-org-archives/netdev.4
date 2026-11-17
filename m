Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953746;
	b=DbiNCKNCmH3O/mOCsGntoGN5Zu/rj4ayYdrEZASg0JHjnwwbdQ4sMXsBDFpdBWM5Mq9e
	 FrM6D5NKacVUomrui/Za60yqzTeI+1vLkY12dcCjMKw0mxrOIC0AWIw+gE72qSeIO3+fu
	 3qy9+mZOfiO82h19IgSrp4+x0q7qnVX7YbdD0zo0mrw/2nVBjQCr4tXVhNh/8ngfEJGS2
	 p/dDsosi7A7F8bGvTkiIqdw1CN7Z2bPMWDphlPJms6qGdouXsZW8nB33QsauF5L6dJKLm
	 RBZr8knm1z2MmTa0JQlAcfQa7GKJFavvy4c17BMrVTsZkvKo31msUAzjgz2GjAPQnBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rcb9VySxJjHdGQ79AoyQc2byoEyKFLaM8e6F4Ddmmw8=;
	b=NyIi3aQ8GGIXh5FoO88F+1N7qaI5Y9FcDOAx1V2cOhKLX+Pp8i7VK4PVvnOyaXAfy60Q
	 /4PUOj4BLWl8UGRp3Lk8S5HNgaguxk4G9qJtRo9M+XPUkPZduKkErhU+OdRxuMOuEN2sO
	 B2p8C4gOQJq1CrVF0AxUSuzk3VrWlx8tzLpSf0pZjgt1O1dwC7nX2++ieWXgpV0DIniGh
	 nXVD3uT+6UbN31JtfUBGz2gZXIdDRVokFPYN6NKZ93W4WoxVscTjeNorNymPDYyOAKIxj
	 JGPtKQ9qecQsQ953V0sQTknXxZQ5WY2oRg+bMS69/2OLwHQRxOCw7Cbbt59xjLNrzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="F67/IN87";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B7B606A33D
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B7B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F67/IN87
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cddee4abc57so98189a12.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794953744; x=1795558544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rcb9VySxJjHdGQ79AoyQc2byoEyKFLaM8e6F4Ddmmw8=;
        b=F67/IN877WOVwmfIez9VsF2w/xb1Uelpmte0J1tRiaRjODzEhj1dkiuHFPpcDARlt5
         Jfai4qps8OsgdUVNpxn6gYSpnAI6e9hcyMsR10hOoteYvBPLFNj0dA3Hy+dy7hozPctb
         dpaG38QGEV80QSzWp7eYvxgR1kE7z+hdhHYCWJhxgRKvOSIesczvLWMMcdoh2tE/21bI
         1RUYCRSag/ypoOqmClAXqwMN1H/RybLCD84LYbsdJsE8O6+DwSw7R+F5fhQ3tt5CmR+T
         kEXEck0wFQv/HgBrD43d+WB8dR8yw7Vc6IkHZuhqAVIaTqWiH2nE3CZwe3ilVqJRjmOh
         vCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953744; x=1795558544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rcb9VySxJjHdGQ79AoyQc2byoEyKFLaM8e6F4Ddmmw8=;
        b=G7bboQSuMx99nS79B9ojlh2WrK74nIj39Xb7UGPyYb+lBQRgw6o4trcdCbMRvX01ie
         XzE1RcHG+qUoDPU/62Z7bgoC16bM1hqLHETYW1eVn+Zlb9utxd8J30ndCmhcsp1DE9Zh
         amYTfWBQJlQdf310QllKGw6uJONqEdttym64AnQ83iwbRsmvbzGMUp6YBhDMshrg4nSn
         usNC5mCcbqTsj+MdQswwA2ruLQjTzRqIKuBtiJSvjGCLgVNkqPUX5FVbHW066itBYMIj
         Aarggiuc1zaUpIueXbGx7Aa1rE2IlZEKCJDd28F96uH/bhH3+HOFaUZ0qea1dmR7KCZF
         LoFQ==
X-Gm-Message-State: APuU4Z8EpAKVqHDw8qZAI7CKFXKAfQRBvDgpGXI3yFrAx/WlUrYhT7/p
	nkpK42b8nWN2Vy/H/vudIiGmZKXJ1Tf3DUX2Mm7L+XTJ8euTT24wIC80hKTrhiviSpQn5ATaurr
	Z71TarW0=
X-Gm-Gg: AZFdTZeJd/Je2BrtSsrPfWT8kNHvEjja2DTgwyR7PySQSRlSMslxyi8OeU/J5l+vCi7
	hdujNw5oFA8PcLgZF7ITFhJ/rgB9JwnHR90qxSCq/fplgXW+6/5tZLy3XR+x5uNJ0okunblI+Bn
	KmdQX79k8V6oMsJ7el2nGqU5++H7OZWlrj6bJArQ/VbSf3Z4kNuWbosg4yp3eakUDx0HO4yL1p/
	U0SImpo2RBe4Jr57/DCMqhBa/VuZZ2AF6gFbwpRWupvr5aH3cTp1tbdMDNwQc2AjpECKYdtkvcS
	CWwSHviqsEwCC9ndHIUT4o99k9dXvOHwh53aEPeGl5nRTu5TxupgD4Ep59GccRDIrlo3kgulV+x
	UX1qEaB5cDYK+B1LLurLasTlSJhzpC5EvMTtIemrQRZrxWY8WLyXPAswKJ4EZ2XZf3YuH/Pic51
	tBfGDf+t3GaUUagwp1F5gTf1dMYds4acjvLSb7mJHy/uyHr2fSgL8kjldjELD+vn0laMR7/tKRe
	qPjcwlqZ6+ITXw8RfxBD4vwPZN2FZjs2mWEvbO7nRAz0ZKlxGUzNY/kRtKGAMo2YnzohaQgue7b
	68lUAoxbzFyuu2/guT8YTku7/prXt15s4GWuH7JpQRJjATjl8DM7jAOctqFIEJ14TWuD
X-Received: by 2002:a17:90b:4d84:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b3d074d047mr804488a91.11.1794953744455;
        Tue, 17 Nov 2026 14:15:44 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm38067a91.0.2026.11.17.14.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:44 -0800 (PST)
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
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3 2/3] ipv6: return EMSGSIZE when first route in dump does not fit
Date: Tue, 17 Nov 2026 14:13:43 -0800
Message-ID: <20261117221538.184948-3-stephen@networkplumber.org>
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

If a route does not fit in an empty dump skb, fib6_dump_node()
suspends the walker and inet6_dump_fib() returns 1.
rtnl_dumpit() then returns skb->len, which is 0, and the dump ends
with NLMSG_DONE and status 0, silently dropping the route and those after it.

This became reachable when multipath routes started being dumped as a
single message with an RTA_MULTIPATH attribute; a wide enough route no
longer fits.

Return -EMSGSIZE in this case, as IPv4 does. This depends on the
rtnl_dumpit() fix in the previous patch.

Fixes: beb1afac518d ("net: ipv6: Add support to dump multipath routes via RTA_MULTIPATH attribute")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
 net/ipv6/ip6_fib.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..3b78ae72d367 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -755,6 +755,10 @@ static int inet6_dump_fib(struct sk_buff *skb, struct netlink_callback *cb)
 
 unlock:
 	rcu_read_unlock();
+
+	/* If stopped before adding, it was because next route too large for skb */
+	if (err > 0 && !skb->len)
+		err = -EMSGSIZE;
 	if (err <= 0)
 		fib6_dump_end(cb);
 	return err;
-- 
2.53.0

