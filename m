Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661775;
	b=ehZu0sOZ74dk6CMHkQerr8KYMISM2xHdqL2ISipO6Krsk2KuknQHOEmyWQEDwjMJPW9p
	 n8Gr0t1Z36UGKgbNo4QG+bBhlq9bJCmjUpJt6UDziGf525+6cdkcqlO1rcmExBrvOWnrj
	 4UXCI5hDDHWnzz2jq3Y6LNqgOKOPl5f/MFn2webk/Mik0U/GUIV+hkyTJ0lURU5VYxjR+
	 EKEdI9gr06PUDlqH+7BFBb76Mla0pjxLqVCbwtzmaOPzB7/GeGWZ5vaY6VK2mLxhrNizb
	 dT/DkGQnjWCJd07dDaUx/HfPM0BJyyCv/0fbS5/6U3/lHZWDyIOX9qDL0mNgWCekWvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661775;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EWIlJrDZ4muO0nryXGH/ltcglSqkjtZ9mO/ngcKgrLI=;
	b=wL/L4MPyEjKkdQISEXpmSLP7QYZ7jy6lA6rj71w3xJNUUsMJiEU/9k1iyKPD/dnzRnTd
	 I+IJZe3Rnkou7ofyDnWZZI1APUY5Bciu3z2K23WfdjZJvY1LyY/mzlN6YmLR6rU7Ru/1C
	 dCQv0rLKBPWnqkA4KO/bYbbQjVaHMh9DQQ1lyYfQO7SPnMMjxfwCBY/gcPtKniE771nea
	 1lU3cvzizv6DgH+A+s7ccFSTf8hygLqShTTYDr1K9T51BXnioLKvtk0lNsKcIzB4PXhFz
	 YKRKu+V1GOqdif+3B2rmzF/3N3BKE7z1+QsXUXSj6T5dyc1NZcKCb0zc2bC/mKJxUXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=jECOak7S;
	arc=none smtp.remote-ip=203.205.221.221
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECC8606E0D9
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECC8606E0D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=jECOak7S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794661772; bh=EWIlJrDZ4muO0nryXGH/ltcglSqkjtZ9mO/ngcKgrLI=;
	h=From:To:Cc:Subject:Date;
	b=jECOak7SenkAuZoMj8h8jJjZBNmpCLTihnmZyfEWWY2SbRwrfx/w6zrnK3rQp2sQ/
	 nES0AUYOcFe+IFThexfJIOXtLjCifEr/qATrulyyojmR8IyDb8jMHJQAq+z1AY1hvL
	 KBu+A07/hHFq10/P1EGGzML/lP8IG3Q2/5zaHvW4=
Received: from localhost.localdomain ([2409:8d5c:8f0:65e5:7443:873c:1230:8af8])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 25C3B2E4; Sat, 14 Nov 2026 21:09:28 +0800
X-QQ-mid: xmsmtpt1794661768tfsi53sf9
Message-ID: <tencent_5C4F5C48FC5F02E908656D1785F653C4E808@qq.com>
X-QQ-XMAILINFO: MVa6T+CC+5BrSXf7p2g+dcckkBkQhK8McNx1knH9G6rtgTCtaL5jhtaV6RD12k
	 Rl1ZE1AIVLu8SRtQd7ozzoV1mfbU/sx6EmmshQiyEckS01frr6f3FjbhYIETkvN8wQUzFFeBgHyT
	 2T1PvEf4xcWf9dQM3NOjSB2WBvqwD0xmtviKTxwBAFy1b1P+MsEtWm3a6ioNhLFbsTd3qNLxX8Ef
	 BQfXAQvqqhP5kc+zQ8/82GPbpiA24Pv0rv3mezKoKdiFpzrm2y8QDhyC9jUjw2rX3keG8ZVA8bFn
	 roetmfE+VzWiqP9MxE43jJ7VNWPdurH2Law6ncYJr1gifw+Km/ruk3evCcFV8gvqcf9eLYz6VdFc
	 jfy5wE7KkJYrQH1d6qh2QiLy5Unx5XVTCGObB51p8E7ZWjcoHd0GB2kHRvzgS1PLlrXL09RWD8dj
	 pk8yWGCI8hn8tZZFVomcp1qB8N41JiM3FW5KGZ6rI+f92ISGjj2Jaje7L06TXdZCmSSDOmqeB071
	 9itU4xgnhMiOuM/u+gNEKfGhb9cLhXshUc1qtHII3ulEb8swMdN6OYYIHJ+k5L7gcR7d9qtFqWPp
	 orpzA0uAdZlkskADxx90UFhAKXkLg6yJqKHUKpvybioJ20eqiPLgTcobA2UYkLINeuw6jVhsIvkf
	 Si91DW19+oMgI6tqO/wzbOsujskqymsCyCjjCUKnU9D89SPLno9+26csd+k9W2nnjVk2+JK7A0CL
	 RF88ig67HBmB9EO61Pc5EX/gR6juHoZRRKSxKOIU0k3dybkoePGqIYomcz9i3SmrvzLpdzq1nnu8
	 dVyTCVNFytOZv4AkLIybPBAX+mBgSr1c6uoXQPThpeNV0EIlHqVymHMv+1AzExG7Hld/xoUQuCPF
	 QYSr/nTL4xFTDI8I6RbF42kUF5UJJGxs2W6D3gzYptFgrzXzN5fgdwvEvyYbD+JlLs9u0Ct5/doH
	 KyNcDrttxATJtjvBjkbk8ZyRKd/XeTvKHWPpD/j8M2ImAZuxs35Id/rI3OJY8yvJa0cKC0IcB+IA
	 tHDz71iQYwnaFXKAk7WP3jKLlTIxDHiBRFImkxh8AGEYiM3Vj2ehotOJiIuH6GBb2aHBOTMTcOK+
	 PO3Kyrt71GNhdnVYR0D9p/p3YzmEX16BJ5dLbQ
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Hang Nan <2122295973@qq.com>
To: netdev@vger.kernel.org
Cc: mptcp@lists.linux.dev,
	matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	willemb@google.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	2122295973@qq.com
Subject: [PATCH net v3 0/4] restore acquire ordering, reject token 0
Date: Sat, 14 Nov 2026 21:09:23 +0800
X-OQ-MSGID: <20261114130927.91839-1-2122295973@qq.com>
X-Mailer: git-send-email 2.47.3
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

From: NanHang <2122295973@qq.com>

This series restores acquire ordering for two remaining lockless socket
lookups that re-validate state after taking a reference, and fixes two
pre-existing defects in the mptcp token hash that no amount of ordering
can cover.

Patch 1 converts mptcp_token_get_sock() and mptcp_token_iter_next() to
refcount_inc_not_zero_acquire().  These sockets live in a
SLAB_TYPESAFE_BY_RCU slab, so the re-check of msk->token and sock_net()
after the increment only rejects a recycled socket if those loads are
ordered after the increment; without the acquire they can be satisfied
before it, against the previous owner's contents.

Patch 2 does the same for reuseport_migrate_sock(), where the listener is
read immediately after the reference is taken.

Patch 3 rejects token 0 in mptcp_token_get_sock().  Token 0 is never
assigned, but it is what mptcp_token_destroy() stores into a socket being
torn down, and what a freshly allocated msk holds until it is hashed.
For a lookup for token 0 both validations compare 0 with 0 and accept
such a socket; the token is copied from the wire by mptcp_parse_option(),
so a peer can ask for it.  The join path then uses the result, including
msk->pm.anno_list, which is initialised only later.

Patch 4 makes mptcp_token_iter_next() re-read the token after the
increment and drop the socket unless it is non-zero and still hashes to
the slot being walked, so a socket recycled in the same network namespace
is not handed to mptcp_diag or the userspace path manager before it is
initialised.

v1 -> v2:
 - Point the Fixes: tags at the commits that introduced each lockless
   lookup instead of at the refcount consolidation (sashiko review).

v2 -> v3:
 - Rewrite the rationale of patch 1: the acquire pairs with the
   SLAB_TYPESAFE_BY_RCU reuse window published by sock_init_data_uid(),
   not with mptcp_token_destroy() (sashiko review).
 - Add patch 3 (token 0 lookup) and patch 4 (iterator slot check), both
   reported by the same review.


Hang Nan (4):
  net: mptcp: take token lookup references with acquire ordering
  net: core: take the reuseport migration reference with acquire
    ordering
  net: mptcp: reject token 0 in mptcp_token_get_sock()
  net: mptcp: verify the token slot in mptcp_token_iter_next()

 net/core/sock_reuseport.c |  3 ++-
 net/mptcp/token.c         | 13 ++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.47.3

