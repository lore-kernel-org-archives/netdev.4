Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758172;
	b=R+ffodEoI1xe5WRKkSqaqGmOSwj+9SXoPCPBfKKC/h1kzqfOsrqAIAl2VHSyahZIuRER
	 iEWfSkOpOfO4r8GEXUAFNFdH+xohwAZQrva74K3k/zJ+yrDAera0/3OKzCXkAYztpvwbh
	 EJZREAErkjdwX/RUpSfX9TEFbbg+pLaZJO6CVuursbb8RYw70KDHosFEKQq916q5/Zcc+
	 fiWuM4PTK16wKXoivLwsLG34RlYclM/rdB+jnO1YpMrBSbhu8hXZ5yM04LKwPCpVczpEK
	 GntLibz0w2tboYATnqbKPcxh6eyVFDhxELDDc+f83IAyl+A8M4ok02q6AxoqGxY4Eug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:In-Reply-To:
	 References:From:Date:Subject:To:Cc;
	bh=0El2dpx+kcvEtHumM5txwEDoI8haDOpbDClqQRzO7u4=;
	b=g45PTfnw785fmYAglBEze6Vr4rnqKZALWUIXy8afcS/jE00k1hSPmYwGyNHuMLpNWEhK
	 siHGjlnWpXk22pBOxm7d77550kjH8CWd9qiLpUnz7/ER4VhyG/rFDdrGqLG+hsR7pe/Fj
	 5w6BeDfeotULurcq66xbDT0WjHnBZ15paJKSJv097xFhHE4axnWxi6NcP+EDSSHYYabUY
	 Lnhcxxr/V1CCAxvz+tcVEQanKsc00kV+xUnNBBQ3GY8jfUeQoppM1thocNxgkgpU/Fosr
	 z4IwXpTH2Mz43Y5tOsZS1QJrBxWvSf8+XS8PYRX2QHmX7C+oEP1QwQ0ivN4z6O0fxQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM1xEZRH;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02840606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02840606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM1xEZRH
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so3828888a91.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758171; x=1796362971; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0El2dpx+kcvEtHumM5txwEDoI8haDOpbDClqQRzO7u4=;
        b=yM1xEZRHBI6YNGcg64w2oQmSGyUiwzXw+5T/n1oQ+Y0nGbmT9tatxjvCnxUP3QHx+m
         QBx57+tOSWF7tRQDBjudUZweOWojFAGlYmnZAlXZWxLauhEWeXysogl94qnI7dJA1vJm
         RJGv//JBZqORUIHv7RuKCocW3S6gydtDcPP3Hp00pTp6xz9RBaRQT3X1AuvQQpoKs1wZ
         7MlIOWzmctkc3IeL6shm/tRv0fMD/Qan//U+Nx1w+Fw8gC0aqibkZUDRkpWi/GzVsb1i
         IuVNCM+i5Xdlm6P92x0Rml7OuLa3ld1P3Z+zoMWBLITX4xLxlzAgM71FLYEVcNqeJVdf
         AzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758171; x=1796362971;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0El2dpx+kcvEtHumM5txwEDoI8haDOpbDClqQRzO7u4=;
        b=GRkJ1a1cFiWanavT848mIx1t2i/F8gvffYIokamaJtEqDTTJaWEXmx4wvArANRpjiq
         85y6zpUhxy6THgrCth+ilURC3KqOP541YJ1zfgKsBLAZkA/i5RqW5Ejfu0hrd3juOSC/
         5OSsc6KYRG3PUfnZuJNXj48j+WaAWFXnfWxoALzaza28BRGOq6JwNjRZQrl50GJweotm
         Jok4vLTcYgKkPRMs4Chd/VuMNAjNqRCUk8d4bWWtZ3lb6FOLXNgkTA6ZiCiGqbiHMn+K
         xv++AYg83GFMY802dVNqJPWnKDBAVKtfDmE1wZUxgRDpX3ISv0pFuELOawJVrh1Wkdkm
         0/Gw==
X-Gm-Message-State: APuU4Z9Iv7q4aHZfKX2bScE/llH0gZ3iogHaOclJr4OcNHH5iKdnnG2A
	iC+/CA+ZNIa6wtdebvO9bYwJMBMowM6/yJKsDp+EQuUnE88WmTQOadsSOzEfEP/ABzPi4g==
X-Gm-Gg: AZFdTZcvAeyF5W6wCC8R0LHkaQDS0DWV7w8YqEtHEAZbQKN43SjealuC9T8b+7yuFHu
	qTpQcx4wJIpFN9RuwucecjHtFxqRW3op9hU+yjk8bpdpHEqraDBRgPwwJ6Xxx/PYRw/eoyEnZLK
	1S207cMhH2S4ZbLcLlgXE8GN7p6ZYxH515MYFXZjM4VPQnVZXrJl7xHbzVuJSZ8QhhC04e8LCqR
	MTsWvY4AnHIEQSwvJvFU9sx+bwfWKtY2Tf6y6hpEcnOixLE+5FSOV704f2ikbyR6lfIjzQNMeew
	EFc4h63jfomPXeBuVWYcimXTRGgCGPmreF5Lp4k0/hg0jx5Fx7HAZXMCjWj2hDGacYnSrWNUnih
	ozoKJKiZD6dIEM6FkBomdnux6eX/xNc5ov/fKoF7TjZoIUg9NtXLmrNUgZRYkOsEtt4I3CfU2z+
	JMoSoEin/7V4e7rPYtzv0rEd3NR8EOkKBIaGa7HIRn+xiPhdTa5KS5aiQM+fhQUunGlwBmE/4kh
	iq4fWsiUnjtDvQHX9l29xDHsktfJXsouZkDJvb1JlpSrl8b9r+h9+VoDqGQEnLgMZPZzae4SJwK
	/kjf3MwKUWKOhCYQDGPiU/PUpNRVMYFsnV+Mtg==
X-Received: by 2002:a17:90b:35d1:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b41cb04e15mr22539524a91.48.1795758171335;
        Thu, 26 Nov 2026 21:42:51 -0800 (PST)
Received: from [169.254.212.233] ([2406:da1c:1ee6:2e01:64c9:ebb0:9e1:f7da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm12022687a12.9.2026.11.26.21.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:42:51 -0800 (PST)
Message-ID: <1a0a6b41df2422c4cea67f1571772b9d22ab200d.1795754281.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795754281.git.n0ps1edzz@gmail.com>
References: <cover.1795754281.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 12:03:30 +0800
Subject: [PATCH net v2 2/4] ipv4: route: fix use-after-free in
 ipv4_confirm_neigh()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Kuniyuki Iwashima <kuniyu@google.com>,
    Hangbin Liu <hangbin.liu@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

dst_confirm_neigh() is reachable from paths that do not hold an RCU read
lock, including udp_sendmsg() with MSG_CONFIRM and MSG_PROBE.

ipv4_confirm_neigh() loads the egress device with dst_dev().  Concurrent
route teardown can replace dst->dev with blackhole_netdev and drop the
route's reference to the old net_device.  The old device can then be freed
before ipv4_confirm_neigh() finishes using the pointer.

An AI-assisted source audit identified the unsafe load.  A delay inserted
after it to widen the race window reproduced the issue on v7.4-rc3 with
KASAN:

  BUG: KASAN: slab-use-after-free in ipv4_confirm_neigh+0xcc8/0xce0
  Read of size 8 ... by task confirm_race4/126

Hold the RCU read lock across the callback and use dst_dev_rcu() to load
the device.  The grace period added to netdev_run_todo() ensures that the
device remains alive until the read-side critical section finishes.

Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/netdev/20261123133000.2.n0ps1edzz@gmail.com/
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/ipv4/route.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index cd69242af..5ceea01f2 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -441,19 +441,25 @@ static struct neighbour *ipv4_dst_neigh_lookup(const struct dst_entry *dst,
 static void ipv4_confirm_neigh(const struct dst_entry *dst, const void *daddr)
 {
 	const struct rtable *rt = container_of(dst, struct rtable, dst);
-	struct net_device *dev = dst_dev(dst);
+	struct net_device *dev;
 	const __be32 *pkey = daddr;
 
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst);
+
 	if (rt->rt_gw_family == AF_INET) {
 		pkey = (const __be32 *)&rt->rt_gw4;
 	} else if (IS_ENABLED(CONFIG_IPV6) && rt->rt_gw_family == AF_INET6) {
-		return __ipv6_confirm_neigh(dev, &rt->rt_gw6);
+		__ipv6_confirm_neigh(dev, &rt->rt_gw6);
+		goto out;
 	} else if (!daddr ||
 		 (rt->rt_flags &
 		  (RTCF_MULTICAST | RTCF_BROADCAST | RTCF_LOCAL))) {
-		return;
+		goto out;
 	}
 	__ipv4_confirm_neigh(dev, *(__force u32 *)pkey);
+out:
+	rcu_read_unlock();
 }
 
 /* Hash tables of size 2048..262144 depending on RAM size.
-- 
2.56.1.windows.1

