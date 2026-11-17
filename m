Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907335;
	b=ZN4VP9gp8mcZxNjkMQoGCew7FPOeE2ocGAPdM7t7FekJK/gcUM5rumt2n6NtPNsAwwBH
	 9aiR/XhDQStW/DkLk6SsqmDCog006fg51EzxNgbBEy1dbgsXSSASDqj/gP6jgwqEiw4/j
	 jVMtkCko1ExqGEg+eOBAtKdtYOHvSOf4TW0bjWav2AO2vnBATJWnWZvo0Hf4wtzr68Hq/
	 asCIvDMx9pGMyYDcyiOIiA2eI1jDz0/sE7jmvlUigf13nbKHKZjS5vZHIsijlLUwe95gK
	 /DIRJ0xI/ukX8xD4LJEcrXatoLFyzQfgD6XTASXR2QQ/eGvvEc7lsg9Z0hrj0GDspPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yb6u44XvrqgEBzrXu63168C9irhvj3KwyZom9iAK0aI=;
	b=0Y+/VftF86155MXWWUW+pOQebyS+I7RJdhBUWse4iIVHzeU5sKLM5dzQP0KTxhzT5SIs
	 98PXAFwaJJXMuq5OV+v9/T4LEUUzivFl76dFvEkyf8KwOl4yoeCkRHgj4tHAv+9nfpKI2
	 HDmtGbzp57YRex9n7KtM+VB9JApjxXoB4y/RBkjPVUOGFj29HZRhPWC/sCmumptya8dIg
	 p0Eo0qtKlTQxPImDAwnlUtopMA1YxCO3/wQT4vZNQwRZPUEqQw1I0VSwKRVXE7bWHELaN
	 5FK1Lc8xAIMvZxntBqt5zNZrDxlHbcQil/RCY9VVERYxjVkaGbQb81iy3jEfZjeYn+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCqxw8Rf;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66893606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66893606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qCqxw8Rf
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2efc5a60bd6so7034395ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794907335; x=1795512135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yb6u44XvrqgEBzrXu63168C9irhvj3KwyZom9iAK0aI=;
        b=qCqxw8RfWo7pZ9gZK2/OOFzdFnddnZWU3F8BdPnBphFDfCGs101taaaQSeD5rdBBQ+
         WWOi72ECg/Vz8lwExssQ8I9wwrpTsbL6T0W91ZIJkuauFQrs4hoIz4SyWgmLdVlbkal8
         JPn7ufWZtXBn1YHNOtUMgNIOlXm5ylVPZfMQdbBwEumwBsCZplh8v7nwu9wDmva+hitz
         eAq4JXD+CQpg4za/tmnX0MJ3lxc7MibjysE9p+OvAWmxAjbF1+ljOcVwceuV1jZ/fqS7
         zYMYn8jxxFzrNOv35JyxMfkp1u8VrVnaEUNLG5MUYMVxddjzRTexmQbypcs7K2X+MkcD
         /Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907335; x=1795512135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yb6u44XvrqgEBzrXu63168C9irhvj3KwyZom9iAK0aI=;
        b=VZJp8XSehY9LAX28wbSuukN21H0KW8ZR6olwaUyB3uaZSFSzVYIynAZqw4hdOo0K+n
         rljd65wf1/sv7ABW6/0vM8W20DdkUC/N31BOCXm1LFWAqJzjZ4o/u5PsRgAt0SK1me6W
         Fx6pVzoXkf09TMQLEMHCtzKWoSHWpt5a0l1MamxpsXKzuqCzZWWauXEhu3VWFvkpHAT/
         vBvSz5glIOleQnc+b0iKurT8VxWq09PTH8p/Qmgrbjmkcpb6+6w0o1GJsJLiBldLrnNO
         qxT85aYFDsi915HTrG2hWq5ptcDQYSXAwh5QcPURMfWfJkxOYw9nsGzxzm2rdU5+bBIz
         y+JQ==
X-Forwarded-Encrypted: i=1; AL+hErHjjpUVEouymJW0ZMeuTdxpG9Z8euKPv6g+vSJYFs9UvSVyKIuIpzu2kYxzCxNLO6fwnANldIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vSxT0po1b62dGMIND/wINTzWOF/Xm68rVo2jYwbl+c5k9ytYW
	p9JiGy7/fg2gD9kWBFshA1te8m+6dm13BuoKBQXJ11wPMrLwhrA9jAUMgYqqHWod
X-Gm-Gg: AZFdTZdrxrI0pOb/xjB/MeUr/+0gNUO/dt4R3BR/naUIbu44Iv1OY/j90QNmMPzF58V
	QpCtVGJK/J77IByPmONEsH6AlzlHQIazcqm3lkxmCEK3VqSKT91Nn1EMjDcetKgOhNw3Q0rKMUE
	SjC6VXI9iBrtVO3h/LJkRY9TJd818PMKsWv5kDM2qK22qSeHFvaqfCGxsdNoEu+GL7Mm+TN5SKj
	T+AK5aFRorTTg6FaspQxrjZoesTugEqTWGVvKKXIaZ0iFtiX6xuP+VXlN7NOWczpXKheG260B8g
	UKO7sCz3VTyX7DMnZ091uqurnG6MpPOkBvAsR5W/62VpVTBXSQuNzn/4BiVRJG/+5GA6sJznTO6
	Bymr1pjP/d+OXqs6pi/jUcTykXXcAfTg/SaYzT5Wy0stzOyx8zyes7jr5H8tyjzfoquy6ae878p
	GJs2VzAKq+2Y54zr9bIpPOortWPaEhH+MCs3lEi1ccqqAqOJqbSF1I/p7XYqRnKPfIiK2IreTwQ
	2gJ2acVvtp0+bJnFzJBWHYwAXb+6xdBK3QGm8ktPb+LDjkRjBITNWDTnU5lxZGWJLL6iOzJl8jG
	j2/3Ggk6BI0hPHTbf/tQsg0+fwIuSh3muSxnAN5Xzz9je3gM
X-Received: by 2002:a17:902:e801:b0:2ed:1ca2:ea5a with SMTP id d9443c01a7336-2ee0dca839cmr135269225ad.51.1794907334563;
        Tue, 17 Nov 2026 01:22:14 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe98cff9fsm1783345ad.33.2026.11.17.01.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:22:14 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: James Chapman <jchapman@katalix.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Chris Elston <celston@katalix.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH net] l2tp: reject short IPv6 address attributes
Date: Tue, 17 Nov 2026 18:21:57 +0900
Message-ID: <20261117092157.85513-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

L2TP_ATTR_IP6_SADDR and L2TP_ATTR_IP6_DADDR are NLA_BINARY with .len set
to sizeof(struct in6_addr), which only bounds the attribute from above.
l2tp_tunnel_sock_create() then copies a full in6_addr out of each one,
so a shorter attribute makes it read past the payload. If the attribute
is the last one in the message this picks up whatever lies behind the
skb tail (stale heap data unless init_on_alloc is set), which ends up
in the socket address and can be read back with L2TP_CMD_TUNNEL_GET.

The commands are GENL_UNS_ADMIN_PERM, so this is reachable from a user
namespace.

Require the exact length.

Fixes: f9bac8df908d ("l2tp: netlink api for l2tpv3 ipv6 unmanaged tunnels")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 net/l2tp/l2tp_netlink.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
index 89ef04c78787..a07009d4cb00 100644
--- a/net/l2tp/l2tp_netlink.c
+++ b/net/l2tp/l2tp_netlink.c
@@ -910,14 +910,8 @@ static const struct nla_policy l2tp_nl_policy[L2TP_ATTR_MAX + 1] = {
 	[L2TP_ATTR_MTU]			= { .type = NLA_U16, },
 	[L2TP_ATTR_MRU]			= { .type = NLA_U16, },
 	[L2TP_ATTR_STATS]		= { .type = NLA_NESTED, },
-	[L2TP_ATTR_IP6_SADDR] = {
-		.type = NLA_BINARY,
-		.len = sizeof(struct in6_addr),
-	},
-	[L2TP_ATTR_IP6_DADDR] = {
-		.type = NLA_BINARY,
-		.len = sizeof(struct in6_addr),
-	},
+	[L2TP_ATTR_IP6_SADDR] = NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
+	[L2TP_ATTR_IP6_DADDR] = NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
 	[L2TP_ATTR_IFNAME] = {
 		.type = NLA_NUL_STRING,
 		.len = IFNAMSIZ - 1,
-- 
2.43.0

