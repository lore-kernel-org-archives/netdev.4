Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572317;
	b=Wl+afj1rpTFWfF3oRwQw00Ta9VACZ9QTXCMHzVUll+tslMpWx/3kJ1mhd+vHdtMe/0gh
	 DpZcF1EyoYDtPnY14uZGgyIqb2ZEveN7aS9xBDoQ11962Ia9x/HnkRd1fZgJH8+mzhjLq
	 CxuSw4vNZgmgOKjq69Qoliy8uvZwrxY8VvQxkz47B9EFR0Iz5WpYqKMKTApO+ZykHIX3K
	 KdUXcbbvCzq+2lk8fiFkVVus6H/WZ3+C8kTwobEWN8dkaiqiK23P1/dfnWttTnp7Q16EE
	 4CJC/wQi0yw2CNHl2uE5oUshjq8n+Vd+biZ/JnCKk2iB6zemKES7wl2cBeOon/zZAlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xGNjmHQEgozT5OsmwV+j7FZqJNARMqhB9lEmkMW2sGU=;
	b=SrogGD9TmrGBvWhn6JjVLMELcyobtV4Ls0rpVd/fr4XxgM4N8z2ft6wH7LrE39ThjoXV
	 4QqoMqFGmIsd4Z5gj/vgqbV7WF53pKL6ytGLRX4FFvLGaCMxvlOw+6mSbYc044+jl0aEv
	 v1MuUkMlUGUi9hx3iAsT3Q02UyO0soXoSoBh2mpe211zT+H3t4tzine5RO6hhw5QeNo13
	 ouHkm6j410vqDzrf1WaWn6KVQ4uCCU7+PPM8Y9ZN7JwxA+iEXMq4Wx3WBwrjBbRz8V9NI
	 f3p13EwMjfATJML6KHAwT3H5enM9zhZIG9qerGGyg4W4NkvLGKlKTRoenv0TaD1KtzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GQd/omlQ";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02242606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02242606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQd/omlQ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f04bea9a93so45438245ad.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795572316; x=1796177116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGNjmHQEgozT5OsmwV+j7FZqJNARMqhB9lEmkMW2sGU=;
        b=GQd/omlQSpO4l82HPTyN7FNAvOmmAC1Le4CRk0R6x8FNwDUuZy6lj7aVzllVH4Hf3A
         NPZX7R1qXkMIj6iTbQsEJsimefxNggBZUj8xqmyAr+Zle0N88fZdo/2+1kybzj8WJp/x
         4VCIIc+05wyLS5xlxzsSc/DKdVs/WtXAezPuv2Or8VtH1apB1YtlKm+hRJtczvdhQNvn
         aaDbh4PSoavWncF2dPwek3Ea8ouufrTMod5ylroOYKV5IgYE3pJEL+WmsKr0FxaJqdtd
         /mO9r9mizb8PHUONVm0JPoP/Bn1g9GwNMBnAvihNJt1CLLpeydzBWgIb4a1jDBevzjIB
         bcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795572316; x=1796177116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGNjmHQEgozT5OsmwV+j7FZqJNARMqhB9lEmkMW2sGU=;
        b=MJ/90GZLp99o1lnGj4sPGY76DZy7zOgdSZW01Nln8c+S9E+1GsjoL8k4Sssqv8hEFx
         tuNUjC3FP0px6+x8BbnwbYLrIID3cI+OJsM+fsV3FxQEoLQ5Qhzg8V3WE2WsHSo/EK6f
         zU6kwurj/1UJBVWSB7U0YQuMUXuEnoWxynoirSo6ZbFsAcjJ9NeZ0xb42AKS/6E7do42
         +bem4Qs2jMVfzd29sS1ztu0NXFc2aQxW5+kgesewvHrGEYd9ySAp6UVi7ZTuOs7RbVah
         z3dGiMuAXxqfdGel1xCqIJ2evthMSota/zBS6eqfLejByKz+f+GZ7QVPH0UzxHFnZ5pc
         jWlg==
X-Forwarded-Encrypted: i=1; AL+hErGS/GJQaXFho8B3a1Z1EPCA8okbo0LlQY5pnVsA71XTWsreSxlPG31ruHsSUsT97QjUijclbfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p87oiA3iCMC4lT9SeN+f+q+5+hmHXWKxQrcrEtd5FRE2/OGqA
	0YMyAWJUzsLW59OnBF+6AGYlKm9fH0i3pgfJ3MKQAzrhSt3X4ldC3R2WuGV2V+Bw
X-Gm-Gg: AZFdTZdCf0zdp6cIyV2nAaCx3mj92fk37kJI28uLmN36u7OZ7J1Q29C6OGqaaJByqAI
	INfp3muOpX8ziHNYPjj/D2b8p2HEgenIz0CV0x+zvfbaCpUT02gEe1YTYPCVITLOyQYCRIBj0XM
	G6aRdxfyMu1eF3GKe/GTND3hGCbY+1blklUQ5t21iIyhTYItc+/8lTm5AOqelygwpj9D8HeCZX2
	fIO0uQpSsxLc/11jAbO8SOWnPdmkM23Lm4dg6s5ebvHyUYbbDsjkYPtHH8kkXEcqL53gvJI9C+U
	K6SRqy7oIZwdWzSIJzJxyNgxPgPf/ykN/dKWavPubMwc1PLLziQJnsAtVd0zfuED/bZ7BpKcTsG
	nP1O5y5Rp8B+p7EfWy5PYE+mwsl1Y2RjyrfdLUBqgeLO/rm4XLxQ6e4zU2AEwMod+j3J2astb2B
	J7gU1hGtFuGqK0eZtJhesh/QnqFSIEIo2bYO4VlgLwNubJ66hcy9h0kw5Ww8HHAHYBpxbAOViN7
	kjwFmNpY3vm8vnxV4gxgZZ6ZE3DSu5H24kQ2S/kTSnono4Y1Vjzjrt5mR1yvlVVsjpXYXpvSOaA
	SC2YJJn+gloESf8AFgJgRdQE7tMBemdyd1T5NC6Tm9hyhDaGtdqohDvRBZaF+yZE57o=
X-Received: by 2002:a17:902:e551:b0:2ef:ee74:792 with SMTP id d9443c01a7336-2f03f232b03mr179125315ad.41.1795572316403;
        Tue, 24 Nov 2026 18:05:16 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee844acsm79064105ad.2.2026.11.24.18.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:05:15 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ying Xue <ying.xue@windriver.com>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Richard Alpe <richard.alpe@ericsson.com>
Subject: [PATCH net] tipc: require a NUL-terminated media name
Date: Wed, 25 Nov 2026 11:05:11 +0900
Message-ID: <179553307369.1670514.10258867019821056369@gmail.com>
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

TIPC_NLA_MEDIA_NAME is an NLA_STRING, which may lack a NUL terminator,
but tipc_nl_media_get() and __tipc_nl_media_set() pass it to
tipc_media_find(), which compares it with strcmp(). A name without a
terminator at the end of the message makes strcmp() read past the
attribute:

  BUG: KMSAN: uninit-value in strcmp (lib/string.c:267)
   strcmp (lib/string.c:267)
   __tipc_nl_media_set (net/tipc/bearer.c:82 net/tipc/bearer.c:1381)
   tipc_nl_media_set (net/tipc/bearer.c:1426)
   genl_family_rcv_msg_doit (net/netlink/genetlink.c:1114)
   genl_rcv_msg (net/netlink/genetlink.c:1209)
   netlink_rcv_skb (net/netlink/af_netlink.c:2585)
  Uninit was created at:
   __alloc_skb (net/core/skbuff.c:716)
   netlink_alloc_large_skb (net/netlink/af_netlink.c:1202)
   netlink_sendmsg (net/netlink/af_netlink.c:1896)

Make it an NLA_NUL_STRING bounded by TIPC_MAX_MEDIA_NAME, as the link
and bearer names already are.

Fixes: 46f15c6794fb ("tipc: add media get/dump to new netlink api")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user: it sends TIPC_NL_MEDIA_SET with the media name "udp" unterminated
at the very end of the message.

#define _GNU_SOURCE
#include <linux/genetlink.h>
#include <linux/tipc_netlink.h>
#include <sched.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

static unsigned char req[256], *p;
static int fd;

static void msg(int family, int cmd)
{
	memset(req, 0, sizeof(req));
	((struct nlmsghdr *)req)->nlmsg_type = family;
	((struct nlmsghdr *)req)->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
	((struct genlmsghdr *)NLMSG_DATA(req))->cmd = cmd;
	((struct genlmsghdr *)NLMSG_DATA(req))->version = 1;
	p = req + NLMSG_LENGTH(GENL_HDRLEN);
}

static struct nlattr *attr(int type, const void *data, int len)
{
	struct nlattr *a = (void *)p;

	a->nla_type = type;
	a->nla_len = NLA_HDRLEN + len;
	memcpy(a + 1, data, len);
	p += NLA_ALIGN(a->nla_len);
	return a;
}

/* sends len bytes; returns the ack's error and copies the family id of a reply */
static int talk(int len, unsigned short *id)
{
	static char buf[8192];
	struct nlmsghdr *nh = (void *)req;
	int n;

	nh->nlmsg_len = len;
	send(fd, req, len, 0);
	for (;;) {
		n = recv(fd, buf, sizeof(buf), 0);
		for (nh = (void *)buf; NLMSG_OK(nh, n); nh = NLMSG_NEXT(nh, n)) {
			struct nlattr *a = (void *)((char *)NLMSG_DATA(nh) + GENL_HDRLEN);
			int rem = nh->nlmsg_len - NLMSG_LENGTH(GENL_HDRLEN);

			if (nh->nlmsg_type == NLMSG_ERROR)
				return ((struct nlmsgerr *)NLMSG_DATA(nh))->error;
			for (; rem >= NLA_HDRLEN && a->nla_len >= NLA_HDRLEN;
			     rem -= NLA_ALIGN(a->nla_len), a = (void *)((char *)a + NLA_ALIGN(a->nla_len)))
				if (id && a->nla_type == CTRL_ATTR_FAMILY_ID)
					memcpy(id, a + 1, 2);
		}
	}
}

int main(void)
{
	struct nlattr *nest, *name;
	unsigned short tipc = 0;

	/* TIPC_NL_MEDIA_SET needs CAP_NET_ADMIN over the netns */
	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return perror("unshare"), 1;
	fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
	msg(GENL_ID_CTRL, CTRL_CMD_GETFAMILY);
	attr(CTRL_ATTR_FAMILY_NAME, TIPC_GENL_V2_NAME, sizeof(TIPC_GENL_V2_NAME));
	talk(p - req, &tipc);

	/* "udp" without a NUL, at the very end of the message */
	msg(tipc, TIPC_NL_MEDIA_SET);
	nest = attr(TIPC_NLA_MEDIA | NLA_F_NESTED, NULL, 0);
	name = attr(TIPC_NLA_MEDIA_NAME, "udp", 3);
	nest->nla_len = (unsigned char *)name + name->nla_len - (unsigned char *)nest;
	printf("TIPC_NL_MEDIA_SET: %d\n", talk((unsigned char *)name + name->nla_len - req, NULL));
	return 0;
}

Without the patch, KMSAN reports the uninit-value above; with it, the
request fails with -EINVAL.

The patch was written with LLM assistance; we reviewed and tested it.

 net/tipc/netlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tipc/netlink.c b/net/tipc/netlink.c
index 1307dd1a9613..4a861a7eb3f6 100644
--- a/net/tipc/netlink.c
+++ b/net/tipc/netlink.c
@@ -137,7 +137,8 @@ const struct nla_policy tipc_nl_bearer_policy[TIPC_NLA_BEARER_MAX + 1]	= {
 
 const struct nla_policy tipc_nl_media_policy[TIPC_NLA_MEDIA_MAX + 1] = {
 	[TIPC_NLA_MEDIA_UNSPEC]		= { .type = NLA_UNSPEC },
-	[TIPC_NLA_MEDIA_NAME]		= { .type = NLA_STRING },
+	[TIPC_NLA_MEDIA_NAME]		= { .type = NLA_NUL_STRING,
+					    .len = TIPC_MAX_MEDIA_NAME },
 	[TIPC_NLA_MEDIA_PROP]		= { .type = NLA_NESTED }
 };
 
-- 
2.43.0

