Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405607;
	b=mmr8ijS/ZK4l1M+T/FCZW9D9M6di6oXsTCvJ2hzkyd4KaST6KzqkxsFUiIJIlu2IvRGw
	 Cpb+4+RYGxyHE3Q6onG9lPME6vfOBFqbdDxp5s4co1oyPakNXOEaMvASbI2KBFSS3DUwZ
	 xmcmDBzFGAAt98SOOVhI5XRSnaIRNLz4jGKD01WayNyHqIWg83QbK1OLAfdxbItf1OnPY
	 hRZ55NVYZsazCnix045ltgk6RvgRR/3W4iTqc3qxffUMWTcrRAj0wXeeZ6mYr1Roprh5X
	 5nQMailUpBx6PSfWbwSAh2bfH0pppwriNEyDUlYRLmwesAXt/Dq2qEEF+l0mZBKWc+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405607;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hacvhlqCVEyZYpmow1jeuuBaUcRM+w1lbqJm788VwAI=;
	b=XRZfrSagu3DnJhC4wON4ZNkLHzFuWJTsFooipDsOF1uOcHDZlEw1BgcfxjNOrhqVq4dA
	 i7blJHNUm4vtGgLFr/GnXKg2BUacp9gJTmnJC1C2keDjSi4W2FJPuUC/0/DwghmP3pVSE
	 Cu8ztMF4I4lbCxRFjdI5w+K7vGQAOLAX2NkNU/7V0pxN7Ff02+l7c/OXua9Swpcg4o9q0
	 6uU/z0EZNXNkrHwnSyI2LhNSNFgHd2xrsXUjfOOfFfkl5rYwJKE+v9nHajK/TozdeXVJR
	 BrvRiPNKjNpTQk3MoWPqPucg3Uylt4vPhQylgeAKQaG7Ycz9O+jS2l/cI7LdlYXzNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ovn.org;
	spf=pass smtp.mailfrom=fe-bounces.ovn.org;
	dkim=pass header.d=ovn.org header.i=@ovn.org header.a=rsa-sha256 header.s=fe-13eddc7e57 header.b="C9uKq/94";
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=KMm3v0NQ;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE2A606A320
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ovn.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ovn.org header.i=@ovn.org header.a=rsa-sha256 header.s=fe-13eddc7e57 header.b=C9uKq/94;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=KMm3v0NQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ovn.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: Autocrypt: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-13eddc7e57;
 t=1795405606; bh=hacvhlqCVEyZYpmow1jeuuBaUcRM+w1lbqJm788VwAI=;
 b=C9uKq/94iuIPRr71b6mXrmH6EeOMvphqI7iRF3sowtZnZGywlQfJq/4mHQJ14bHSWbwZTozhs
 XVtiq60ahr1WInhunnApijXMBc/pjtyR9kAHGl6rmEo2CnXQjsyUyekyij5pjfuYfJziTWGiDf6
 QCw6tYzldHBM4qyeb+gxuJs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: Autocrypt: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795405606; bh=hacvhlqCVEyZYpmow1jeuuBaUcRM+w1lbqJm788VwAI=;
 b=KMm3v0NQQ1uDOp926aOl8HSR7nrwZ4D17nrV9BKkMqaysK9zTsTY2KQciqmfKiNfUgJi8ggks
 T+gScUmjjApWL6+sheYs03Hpl53K2VGW7qBw1uAtenj7txnlkaAj9qLng5ligBcWEB6hyVTPaX7
 O8//98VPYo9zKy6i+26zmIQ=
CFBL-Feedback-ID: 6b03b725921a6e934196c2a6:0374b112ad4bb38e8fb37796d0db95e6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b03b725921a6e934196c2a6
X-Forward-Email-Sender: rfc822; i.maximets@ovn.org, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e6d7aa66-3df1-476d-a8cb-359827cd8243@ovn.org>
Date: Mon, 23 Nov 2026 04:46:41 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: openvswitch: avoid hashing the network
 namespace pointer
To: Zhengchuan Liang <zcliangcn@gmail.com>, Aaron Conole <aconole@redhat.com>
Cc: Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, dev@openvswitch.org, linux-kernel@vger.kernel.org
References: <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 xsFNBF77bOMBEADVZQ4iajIECGfH3hpQMQjhIQlyKX4hIB3OccKl5XvB/JqVPJWuZQRuqNQG
 /B70MP6km95KnWLZ4H1/5YOJK2l7VN7nO+tyF+I+srcKq8Ai6S3vyiP9zPCrZkYvhqChNOCF
 pNqdWBEmTvLZeVPmfdrjmzCLXVLi5De9HpIZQFg/Ztgj1AZENNQjYjtDdObMHuJQNJ6ubPIW
 cvOOn4WBr8NsP4a2OuHSTdVyAJwcDhu+WrS/Bj3KlQXIdPv3Zm5x9u/56NmCn1tSkLrEgi0i
 /nJNeH5QhPdYGtNzPixKgPmCKz54/LDxU61AmBvyRve+U80ukS+5vWk8zvnCGvL0ms7kx5sA
 tETpbKEV3d7CB3sQEym8B8gl0Ux9KzGp5lbhxxO995KWzZWWokVUcevGBKsAx4a/C0wTVOpP
 FbQsq6xEpTKBZwlCpxyJi3/PbZQJ95T8Uw6tlJkPmNx8CasiqNy2872gD1nN/WOP8m+cIQNu
 o6NOiz6VzNcowhEihE8Nkw9V+zfCxC8SzSBuYCiVX6FpgKzY/Tx+v2uO4f/8FoZj2trzXdLk
 BaIiyqnE0mtmTQE8jRa29qdh+s5DNArYAchJdeKuLQYnxy+9U1SMMzJoNUX5uRy6/3KrMoC/
 7zhn44x77gSoe7XVM6mr/mK+ViVB7v9JfqlZuiHDkJnS3yxKPwARAQABzSJJbHlhIE1heGlt
 ZXRzIDxpLm1heGltZXRzQG92bi5vcmc+wsGUBBMBCAA+AhsDBQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAFiEEh+ma1RKWrHCY821auffsd8gpv5YFAmfB9JAFCQyI7q0ACgkQuffsd8gpv5YQ
 og/8DXt1UOznvjdXRHVydbU6Ws+1iUrxlwnFH4WckoFgH4jAabt25yTa1Z4YX8Vz0mbRhTPX
 M/j1uORyObLem3of4YCd4ymh7nSu++KdKnNsZVHxMcoiic9ILPIaWYa8kTvyIDT2AEVfn9M+
 vskM0yDbKa6TAHgr/0jCxbS+mvN0ZzDuR/LHTgy3e58097SWJohj0h3Dpu+XfuNiZCLCZ1/G
 AbBCPMw+r7baH/0evkX33RCBZwvh6tKu+rCatVGk72qRYNLCwF0YcGuNBsJiN9Aa/7ipkrA7
 Xp7YvY3Y1OrKnQfdjp3mSXmknqPtwqnWzXvdfkWkZKShu0xSk+AjdFWCV3NOzQaH3CJ67NXm
 aPjJCIykoTOoQ7eEP6+m3WcgpRVkn9bGK9ng03MLSymTPmdINhC5pjOqBP7hLqYi89GN0MIT
 Ly2zD4m/8T8wPV9yo7GRk4kkwD0yN05PV2IzJECdOXSSStsf5JWObTwzhKyXJxQE+Kb67Wwa
 LYJgltFjpByF5GEO4Xe7iYTjwEoSSOfaR0kokUVM9pxIkZlzG1mwiytPadBt+VcmPQWcO5pi
 WxUI7biRYt4aLriuKeRpk94ai9+52KAk7Lz3KUWoyRwdZINqkI/aDZL6meWmcrOJWCUMW73e
 4cMqK5XFnGqolhK4RQu+8IHkSXtmWui7LUeEvO/OwU0EXvts4wEQANCXyDOic0j2QKeyj/ga
 OD1oKl44JQfOgcyLVDZGYyEnyl6b/tV1mNb57y/YQYr33fwMS1hMj9eqY6tlMTNz+ciGZZWV
 YkPNHA+aFuPTzCLrapLiz829M5LctB2448bsgxFq0TPrr5KYx6AkuWzOVq/X5wYEM6djbWLc
 VWgJ3o0QBOI4/uB89xTf7mgcIcbwEf6yb/86Cs+jaHcUtJcLsVuzW5RVMVf9F+Sf/b98Lzrr
 2/mIB7clOXZJSgtV79Alxym4H0cEZabwiXnigjjsLsp4ojhGgakgCwftLkhAnQT3oBLH/6ix
 87ahawG3qlyIB8ZZKHsvTxbWte6c6xE5dmmLIDN44SajAdmjt1i7SbAwFIFjuFJGpsnfdQv1
 OiIVzJ44kdRJG8kQWPPua/k+AtwJt/gjCxv5p8sKVXTNtIP/sd3EMs2xwbF8McebLE9JCDQ1
 RXVHceAmPWVCq3WrFuX9dSlgf3RWTqNiWZC0a8Hn6fNDp26TzLbdo9mnxbU4I/3BbcAJZI9p
 9ELaE9rw3LU8esKqRIfaZqPtrdm1C+e5gZa2gkmEzG+WEsS0MKtJyOFnuglGl1ZBxR1uFvbU
 VXhewCNoviXxkkPk/DanIgYB1nUtkPC+BHkJJYCyf9Kfl33s/bai34aaxkGXqpKv+CInARg3
 fCikcHzYYWKaXS6HABEBAAHCwXwEGAEIACYCGwwWIQSH6ZrVEpascJjzbVq59+x3yCm/lgUC
 Z8H0qQUJDIjuxgAKCRC59+x3yCm/loAdD/wJCOhPp9711J18B9c4f+eNAk5vrC9Cj3RyOusH
 Hebb9HtSFm155Zz3xiizw70MSyOVikjbTocFAJo5VhkyuN0QJIP678SWzriwym+EG0B5P97h
 FSLBlRsTi4KD8f1Ll3OT03lD3o/5Qt37zFgD4mCD6OxAShPxhI3gkVHBuA0GxF01MadJEjMu
 jWgZoj75rCLG9sC6L4r28GEGqUFlTKjseYehLw0s3iR53LxS7HfJVHcFBX3rUcKFJBhuO6Ha
 /GggRvTbn3PXxR5UIgiBMjUlqxzYH4fe7pYR7z1m4nQcaFWW+JhY/BYHJyMGLfnqTn1FsIwP
 dbhEjYbFnJE9Vzvf+RJcRQVyLDn/TfWbETf0bLGHeF2GUPvNXYEu7oKddvnUvJK5U/BuwQXy
 TRFbae4Ie96QMcPBL9ZLX8M2K4XUydZBeHw+9lP1J6NJrQiX7MzexpkKNy4ukDzPrRE/ruui
 yWOKeCw9bCZX4a/uFw77TZMEq3upjeq21oi6NMTwvvWWMYuEKNi0340yZRrBdcDhbXkl9x/o
 skB2IbnvSB8iikbPng1ihCTXpA2yxioUQ96Akb+WEGopPWzlxTTK+T03G2ljOtspjZXKuywV
 Wu/eHyqHMyTu8UVcMRR44ki8wam0LMs+fH4dRxw5ck69AkV+JsYQVfI7tdOu7+r465LUfg==
In-Reply-To: <b2853b9410d049e08b3e2ae2491e775506b4f0e8.1795122681.git.zcliangcn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/26 10:20 PM, Zhengchuan Liang wrote:
> The Open vSwitch vport name table uses the network namespace pointer as
> the Jenkins hash seed. When an Open vSwitch vport already exists in the
> attacker's network namespace, unprivileged OVS_VPORT_CMD_GET requests can
> look up attacker-chosen missing names and time whether those lookups
> traverse an occupied bucket. Ranking the resulting collision pattern
> across possible KASLR slides recovers the init_net pointer and thus the
> kernel text base.
> 
> Use the namespace cookie instead. It is a stable, unique, non-address
> identifier that is deliberately exposed to userspace. setup_net() assigns
> it before per-net initializers run, and it remains unchanged for the
> namespace lifetime. Hash the cookie down to a 32-bit seed so vports in
> different namespaces retain namespace-dependent bucket placement.
> 
> Found by AI-assisted code review and reproduced on an unmodified kernel
> without fault injection. After privileged setup created the resident
> vport, the timing measurements ran as an unprivileged user with no
> effective capabilities. With this change, the pointer-derived prediction
> fails. Existing and missing vport lookups behave as expected. Identically
> named vports in separate network namespaces remain independent.
> 
> Fixes: 46df7b814548 ("openvswitch: Add support for network namespaces.")
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
> 
> ---
> Changes in v2:
> - Use hash_64() rather than jhash_2words() to derive the 32-bit seed.
> - Use u32 for the local hash value.
> - Drop Cc: stable because this net-next change is not a stable candidate.
> - Drop the deprecated Assisted-by trailer.
> 
> v1: https://lore.kernel.org/netdev/4e124b37fc972925a825881c50f95eb6b3c2e231.1794989369.git.zcliangcn@gmail.com/
> ---
>  net/openvswitch/vport.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
> index 083f7a8d9d4e..04e4df103b26 100644
> --- a/net/openvswitch/vport.c
> +++ b/net/openvswitch/vport.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/etherdevice.h>
> +#include <linux/hash.h>
>  #include <linux/if.h>
>  #include <linux/if_vlan.h>
>  #include <linux/jhash.h>
> @@ -53,7 +54,8 @@ void ovs_vport_exit(void)
>  
>  static struct hlist_head *hash_bucket(const struct net *net, const char *name)
>  {
> -	unsigned int hash = jhash(name, strlen(name), (unsigned long) net);
> +	u32 hash = jhash(name, strlen(name), hash_64(net->net_cookie, 32));
> +
Sashiko had a nice comment about using net_hash_mix() as a seed, which
seems to be a good idea as it fits the use case pretty well.

Best regards, Ilya Maximets.
