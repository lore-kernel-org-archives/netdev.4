Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437403;
	b=xkrgqB4CEweaK3OfPotSgEXClQC/cdiGhpSXQwoWTlysiq6zkNuaGUzw0Nnk5RXl6f4O
	 eUx3xyc4wKuYV4e8QZEy87Zegk/k7yvtUOoEZb/vnWkUQn0lT/Kicn1ZIQqKp1POiESTs
	 qQsh3SSye3b4BHo8NjH5/WiZ0fIPb9HIe0JVBNsidtskR4EjY6e9kbDRcafjib0mforhU
	 O6tey/cUaT/keQk4Qk6kl9kph0xf8WpJ++iHQmMQyNYm7VpVPG8i6lWvBGlyTlD6dR4ZG
	 jdutvF42Cd9b7v/lYwkJmk39tyBuRbhMcM4aliDlsyZWag/eB5l9xQkcoEzF0t4Sc7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437403;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RcfCnrZOkRa2FxDbd/xz35KCsZvIVfnVJFvLRnPvNAs=;
	b=0ARIINaB7Wifh/Hsbb4LA2DXvyJlAywpzRB42azHj4Y6fD7Gb8FYJApWx3kgzCXvpB+y
	 B47nHYDgnwn1CEDkpOlLDsZhYMY8/0VHo+AzIEim/4Y41NyJrZZQ18sGijszjkTW2lc+W
	 sdDqgNHQRm7I8O0snw+ZuEesqrdWF/R5pev32mDkL3B5KjBHM/3Ks0K8BsdUmQ+gReOzN
	 FKsJv9GET2aTbxsB7OSIRJztAxz/I5MuNK/oRYu4EfCq82ka7iefuNEn9ZJe/PyzrHJD+
	 aS6WpJ29VHfXk+BJHf6CHImkNetb6cBJvQXnIhRtd+pQQuPU7WP/mjNwQ5jaS1W8TbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0BPR2u+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA66606A32C;
	Mon, 23 Nov 2026 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A0BPR2u+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B435C1F000D3;
	Mon, 23 Nov 2026 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437403;
	bh=RcfCnrZOkRa2FxDbd/xz35KCsZvIVfnVJFvLRnPvNAs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A0BPR2u+dDWQ54Ewu6NpAaXhhhC13gRsvUJvNNvLtY07mLj+zxKE8v4WoiFSYuPWM
	 Qya2srnj82fluEsenjpnv17VJmne35JAefie7mjDqCUAxvGmmPGA37yWrwwevx23aV
	 +9wgldEMW7wkgxcgqlbJlFpA7vhpOw4Tq0lCAwdyHiUcr86wlE5AdurPtGvoPLwewM
	 Ujnmxwuft/58Rfq/zncCO/9u0AR1hHqDCOH0/SL5L1M/z9Ai/SVvu8/etkEZic5HgI
	 8X+WEp64S3xgILiB3OfRwhi984pqBX5xBMj+STXqHQUxp28Qd+6oaKZgyZ0kd1BghN
	 6/0mys/xebscw==
Subject: Re: [PATCH net] phonet: do not autobind a socket to port 0
From: netdev-bot+sashiko@kernel.org
To: amisiurov@cloudlinux.com
Cc: courmisch@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 zhangdandan@uniontech.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:36:42 +0000
Message-ID: <179543740229.3135.7763014717205061989@kernel.org>
In-Reply-To: <20261119122127.1708071-1-amisiurov@cloudlinux.com>
References: <20261119122127.1708071-1-amisiurov@cloudlinux.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The Fixes: tag points to the wrong commit.
- [Medium] The commit message says the crash is "deterministic and
  triggerable by an unprivileged socket".
- [Low] After this patch the sysctl and the allocator disagree about port
  0.

--

phonet: do not autobind a socket to port 0

This patch makes pn_sock_get_port() skip port 0 when it searches for a
free port during autobind. Without it, a net.phonet.local_port_range that
starts at 0 lets a socket be hashed with sobject == 0. The next walk of
hash bucket 0 then hits BUG_ON(!pn->sobject) in pn_find_sock_by_sa().

> It is deterministic and triggerable by an unprivileged socket. Skip port 0
> when searching for a free port; 0 is reserved for the unbound state and must
> never be handed out.

[Severity: Medium]

Is the "unprivileged" part accurate? pn_socket_create() refuses to create
any AF_PHONET socket without CAP_SYS_ADMIN in the initial user namespace:

net/phonet/af_phonet.c:pn_socket_create() {
    ...
	if (!capable(CAP_SYS_ADMIN))
		return -EPERM;
    ...
}

Port 0 is also only a candidate after a range starting at 0 is written to
net.phonet.local_port_range. That sysctl is registered only in init_net,
with mode 0644:

net/phonet/sysctl.c:phonet_sysctl_init() {
	phonet_table_hrd = register_net_sysctl(&init_net, "net/phonet", phonet_table);
    ...
}

The default range is DYNAMIC_PORT_MIN..DYNAMIC_PORT_MAX (0x40..0x7f), which
does not include 0.

The incoming packet path in the commit message also needs a socket already
hashed with sobject 0, so it needs the same setup.

So the crash seems to need init namespace root to set the range, plus a
process with CAP_SYS_ADMIN. This commit message came out of a CVE backport
review. Could it state the privilege requirements more precisely?

> Fixes: 5b0c911bcdbd ("net: phonet: do not BUG_ON() in pn_socket_autobind() on failed bind")

[Severity: Medium]

Is this the right commit for the Fixes tag? 5b0c911bcdbd only changed the
-EINVAL handling in pn_socket_autobind():

	if (err != -EINVAL || unlikely(!pn_port(pn_sk(sock->sk)->sobject)))
		return err;

The port 0 crash described here never takes that branch. With
local_port_range set to "0 0", the first autobind succeeds:

pn_socket_autobind()
  pn_socket_bind()
    pn_sock_get_port()    port_cur == 0, nothing found in bucket 0
    pn->sobject = pn_object(0, 0) == 0
    sk->sk_prot->hash()   socket hashed into bucket 0
  returns 0

On the next autobind, this check in pn_socket_bind() still passes, because
pn_port(pn->sobject) is 0:

	if (sk->sk_state != TCP_CLOSE || pn_port(pn->sobject)) {
		err = -EINVAL; /* attempt to rebind */
		goto out;
	}

get_port() then walks bucket 0 again and hits BUG_ON(!pn->sobject) in
pn_find_sock_by_sa(). The code before 5b0c911bcdbd takes exactly the same
path.

The search loop and the BUG_ON() go back to ba113a94b750 ("Phonet: common
socket glue"). The configurable pmin/pmax in pn_sock_get_port() and the
local_port_range_min of {0, 0} come from 87ab4e20b445 ("Phonet: proc
interface for port range"). Both are from 2008.

Should this be the following instead?

Fixes: 87ab4e20b445 ("Phonet: proc interface for port range")

The current tag suggests only kernels with 5b0c911bcdbd are affected. That
matters for stable routing.

> diff --git a/net/phonet/socket.c b/net/phonet/socket.c
> index ad12b746d4fca..eaa7d6a228f25 100644
> --- a/net/phonet/socket.c
> +++ b/net/phonet/socket.c
> @@ -490,6 +490,8 @@ int pn_sock_get_port(struct sock *sk, unsigned short sport)
>  			port_cur++;
>  			if (port_cur < pmin || port_cur > pmax)
>  				port_cur = pmin;
> +			if (!port_cur)
> +				continue;

[Severity: Low]

This isn't a bug, but the sysctl and the allocator now disagree about
port 0. net/phonet/sysctl.c still allows 0 as the lower bound:

static int local_port_range_min[2] = {0, 0};

proc_local_port_range() passes that as .extra1 to proc_dointvec_minmax().
Its only other check is range[1] < range[0], so writing "0 0" still
succeeds.

After this change, that range has no usable ports. The loop runs once,
skips 0, and pn_sock_get_port() returns -EADDRINUSE. sendmsg, connect and
listen on unbound sockets then fail through pn_socket_autobind(), with
nothing pointing at the configuration. A range of "0 N" quietly behaves
like "1 N".

The commit message says 0 "must never be handed out". Would it make sense
to raise local_port_range_min to {1, 1}, so the write is rejected, and keep
this skip as a backstop? That would make writes of "0 N" return -EINVAL,
so it may be a call for the maintainers.

>  
>  			pn_sockaddr_set_port(&try_sa, port_cur);
>  			tmpsk = pn_find_sock_by_sa(net, &try_sa);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119122127.1708071-1-amisiurov%40cloudlinux.com
