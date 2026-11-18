Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004944;
	b=0VdpiRsURmTq/stVLpu34oiENTTRFDMaZrhmUVe1tQyMGc9EwQcElrnEa5CFu7ONKjYR
	 b6z6xQuD0ksy6b5W/Xt5pizHOVW5QWIAX7anO3vpuuKQFYC+/aek3oLf89MXzn/3EVjC5
	 yY03pXLESOj+obny4TUs3KKtYtZgv+CVrTgjQQ8RAksblUX03lSZifqfh28vW76qz/yzi
	 taia1V9wCo9sDFdN6nz98RFYjRpH3uTYrmrPhaSjxkxruOlMq/pVakzxAAXiq5L7WrErP
	 QiqFp9ZdI5WEaT5gWmmkcq54gykm0wuQDgsbzo4llXGUfMOKo1eLq/V1qCwwJ5Mzgxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rBHUNIeg71PAnIVFvGQABUjBmJpAmg4Ag12k4fFD3zs=;
	b=Gzzu2jEiomlCLz/Wrk7YDmPVmZl/9RFjfixduEvRyX0QK2c1vrpMati9NMpr9JScOUf1
	 s5jds/RHJ41FlUsUwQYL7HKItRrnnQE3VeDfRNqaTtB692urfhrcbCllcNUq+uwi/vUwY
	 5Pz88uT93Yo7+BtJEhs8kOKguSzF6q4JkDYek38FmbT5wzIgQxetmzHiCv2+wB2OPGc9a
	 B6dLAip1Fqckh7N3OV+vHIB9lx7L8FiZ55UiVkhbC51fk/JIEYLzT4/s0E3m1XiqM06Mn
	 0cY7fxtuvNw80TIaxmkQ9EK2PDMLBbf0M/iyUs1X8tSIVj/EgpPaH6UlsQKXPDyLrAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOFCtPLR;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0863E606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0863E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOFCtPLR
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so2233201eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 04:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795004943; x=1795609743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBHUNIeg71PAnIVFvGQABUjBmJpAmg4Ag12k4fFD3zs=;
        b=uOFCtPLRh6NiXcbVdbUMDTaueXMu9tBgVehZNx1X/7saTLLqJJH0TeWDC6935IlAE5
         CKVOJbMQOHsmEBnuN0YSguK8etPgLd2L5/l4Dn3wlr44jq9cPLX+aHG/bENtqnp6A7cS
         seSwO/na0zf0KB5ckjcceImRMOjtCKDOAohMAn5/CWRaVYXxP87oj4YC/Cx6tbgucJwV
         lZRGYwEgxMG3FfHrvqjnLetz8+2k/7v8ZTFI3Xs6qRNJeWgj+wRmGJLQYaWJwAlKVj0L
         ZBSHkPGS/f1laGbMvuO4fFcv9wrYvRvtbvcBIX2Qqqvm+o41Tr4rB5kjU8YS7PzbE4E9
         na0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004943; x=1795609743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBHUNIeg71PAnIVFvGQABUjBmJpAmg4Ag12k4fFD3zs=;
        b=vPtFtpv+X5yeD7+5Kw+HELf2r+0JO7i9b617LYZVhtQFUbTvojZAobFxIQ0tkdaTl4
         SPBF5SBSvB38cIzs/IQi/p7EaXOEk/V8PALLIq6dim+Gf532K3uagu/mikxc7uFNu0bw
         g03yUoJkt30ia2ClwqIbBbwkhsp6ujkxdawc1Th1NfDBncHp+y2nKSot5ibx4JYNanGE
         MFyLOa/O0sFF2UDG8c4erW+3ttVIutWW6wiuU+qUH0O5tjLpM1kKmsyIo38SgfcLQMqA
         axZk1HO06fc7+1BOw1ct0X3ntIzo3O/pK2N2Wt8g6mxu2m7xESCH+WZ1QjNwMWq/VH1a
         nQTQ==
X-Forwarded-Encrypted: i=1; AL+hErFA2+g1eNYaW3bT8kdJ5QPYRpeyibN9W5jIJbrrB9oS6dstIfbrQqKsF/LmnDnisFgo1S4qTEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z897zk6nRY9T5KvRXv6W+T4waOln6NJjrOxVtr4kFe5rJTjuiDa
	DgnACjbBLcA09p7NllQdefWj9jvU6lvJe2BJ4oDutigmPBC8k52ZM8wnJOTAJChF
X-Gm-Gg: AZFdTZfUgKoiOLOiKTY5ZF0yvE3ucKxFmT12y6quT8nzwaN5SZtC8Ve0V/4xnGYXW48
	qbZvyXZUgO6lE1FVHjNeTmVyMu4OWB4r5kZxqvqKSzQv6owl367oQ3qaoJpteVH0OENllNwcCMA
	nNnxs7PH5dwClYP7Ouk8+bSAxD1sibLiPcCmUCpo6isbW8b5mkeDhFtcZx7AW2mykDMX1hP3s/8
	sVdOYvVYNY+H6ZFaItwxMA8LAbSCJQYYgbZKe0p65DkQvUXsGH8IU8M56mp4rnVqBnMvs+OPiUa
	umnpxxs2LjxtXB2Np+cQOhcRRCKli3X8eKon61vXZpXVZ4SerHilF89FolsD5LONYbQntaJmnpR
	WIkTL5QKOGmgPhucqjsEqlG2GSNRHcKguT4xuJDH3kJ24b28Bcyvv89VP2WerVMm3WgePt/SxMK
	0QpY1mMfv9uM1LTgYt4tywfBn6EjFCzPJb3/N5qrLj+bdTFn31B+JIR/5sRlX095/S1kESzk4TA
	Ie0M9yuPLOmZ/7Gzrd/L7S1orGdHK34MYRarkwYC565cGt0ga4vBdk3YKATDRYR2Fie+Ai7BCQI
	5GXrPETvs9M5pjneUSNyMyWCU6yVwM1H9LzLJMOQOiWxUrrjLnM2sgKq9Tvr1+xn3KtRRvXxEOE
	U937pqiIOxc5slGwMGPT2ySQg3zsWne7lZZzMtIhBUN4bfp9GvaoOEAicIPXBK70TUv7XvjyDkK
	v1JFAVs1MU2i8nAaFfXiVWcYKqiHSoz1RGO43AKV24bPKh9uXJjEgLh/bDulJNZaDfFBYMDiHUZ
	n1ZeAkpFOPW
X-Received: by 2002:a05:7300:2150:b0:383:bc0:77ea with SMTP id 5a478bee46e88-3830bc0895fmr1468156eec.30.1795004942743;
        Wed, 18 Nov 2026 04:29:02 -0800 (PST)
Received: from FT6N242TWK ([223.181.117.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm8948312eec.27.2026.11.18.04.28.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 04:29:02 -0800 (PST)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v2] netfilter: ctnetlink: support port filters for SCTP
Date: Wed, 18 Nov 2026 17:58:56 +0530
Message-ID: <20261118122857.86193-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The kernel side filtering of ctnetlink compares CTA_PROTO_SRC_PORT and
CTA_PROTO_DST_PORT only for TCP and UDP entries. The SCTP l4proto
parses these attributes into the filter tuple
(nf_ct_port_nlattr_to_tuple()), so a filter such as "protonum SCTP,
src port X" is accepted, but the port is not compared and every SCTP
entry matches. A filtered dump then lists all SCTP entries, and a
filtered IPCTNL_MSG_CT_DELETE removes all of them.

Compare the ports for SCTP entries as well. The SCTP port has the same
offset as the TCP port in nf_conntrack_man_proto and in the dst union,
so the existing comparison works unchanged.

Found by reading the code with LLM assistance. Tested on x86_64 under
QEMU: with three SCTP entries, a delete filtered on one source port
removed all three before this change and only the matching one with
it. Filtered dumps show the same difference.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Changes in v2:
- Target nf-next as a feature, not a fix (Pablo). Drop the Fixes tag
  and Cc: stable.
- Drop GRE, which has no ports (Pablo).

v1: https://lore.kernel.org/all/20261118042950.83129-1-jain.sm@gmail.com/

Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

The QEMU test above was run on v1, whose SCTP part is this change (a
small raw ctnetlink program in a busybox initramfs, x86_64, TCG; TCP
entries behave the same before and after).

 net/netfilter/nf_conntrack_netlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 4b6abe3..798c11d 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -1127,6 +1127,7 @@ static int ctnetlink_filter_match_tuple(struct nf_conntrack_tuple *filter_tuple,
 	switch (ct_tuple->dst.protonum) {
 	case IPPROTO_TCP:
 	case IPPROTO_UDP:
+	case IPPROTO_SCTP:
 		if ((flags & CTA_FILTER_FLAG(CTA_PROTO_SRC_PORT)) &&
 		    filter_tuple->src.u.tcp.port != ct_tuple->src.u.tcp.port)
 			return 0;
-- 
2.54.0 (Apple Git-157)

base-commit: d0107f38162279d9cb0e012210731176265f835d
