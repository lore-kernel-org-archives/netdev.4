Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050992;
	b=C62WtHIj1+2mlzA7HKBYolZUeviD3c66IaUzSaSD1DpxvmhNZilgsd/R9OpZozQ1p93m
	 r03XrQakua/0t2pK40KzbUZRR9KCCRbzG0Q5iTJlzzzRKu0zwK93o7am9Qa5S5q+tlFbn
	 uts5PMDgeP9RiQ5FazDJooWtx8+gOOS0W+vXNvP+PWJEomFgCF2yAOxZbWvz9cSDZdMNj
	 AIL+qbIa+rmE5cXirX9aQGYZrDIK2awbB5GhcdiTlNPuTHogA+VIdToUefxFNqwzCjgaC
	 ltrclEGzIZHM74jYq5q7fO6m7XzVY6RLBp4nVsAdOG49IVaqGn5zuqYAaHEoLLRNhpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=9GD/UNHBWrOUFrMAE4LOfnoLY5uKQdUtivTrlJSCxsA=;
	b=mWdM9yK0saZ3Ax/0nV1N8b/lFRKPNAcp++6PKco6csZjkUqPsbXmH0VE3HGEUc25kL5N
	 ReCrcltuAYYxHqGk8LvxAu4Xw0ZVKVSwVFxunZaGnCpd9k8V7ydB3R2ebri+5cxTRqnNA
	 G5/fevszoj+wGSsEbyi/1g85JTp2lDq0+T1+zqPxVo6y+WLesDr7/3AN1T3QH1bVEn9IN
	 OXyOBY00NzClhZhutE73H96whkRRqMI6etvIS2EB0KVzSW73+QjdT1/XZeoHbTLxzoIy3
	 l6i7fzWtkJefKW37SdNBaHW3o+iKR3vAfRHaBy/Z/cP2rkJuiOXUpvu/w6F4mDeEjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1PmIEFf;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922AE606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922AE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h1PmIEFf
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc758830601so1405482a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795050991; x=1795655791; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9GD/UNHBWrOUFrMAE4LOfnoLY5uKQdUtivTrlJSCxsA=;
        b=h1PmIEFfgFgvcdYCELklSygeCh82nQRnbcx+1KUk+Opo6Szk33dVhS8DgC7XRBJnof
         95YBBBMJ5G1hu7vny2tbV31PKak3z/3lQISPHaN+61fjoia76dmC8a2cLEMDoldl0ZNH
         NCCXFtHYKK31vSdyHqIV7gMDnESt+ICH+WW3FwzY7fCn34aaKWgF+awXuBPxf/8Ot4CW
         Z/ZskErk8cYOUBuyZBZ/Ezy9fJ8+4wM54aoutREyvRWX76Dfx+DCEPWCuNts1ZlyO7KQ
         6KRDzVJ/rw/sxsl+3G7yqv1MsvIhKW92O2EY19BC19GDWgf/RKEO7uNINNu2Dy3K4zR5
         PZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050991; x=1795655791;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GD/UNHBWrOUFrMAE4LOfnoLY5uKQdUtivTrlJSCxsA=;
        b=Zev4suOM0LQ1XKUghqlskqSINVDfraKZffoLKgGONpLkrI0HUk1/JuzgU92xhjp7Al
         5Cyb46cTUW5p5KNAAqSP0bpjdIGQW6w9vss6DMCBJkY8vh061NCE+HZUPqY8cXTWesPo
         JebZAiyHgSXF6HyIX2ymj1EeAQdd4pt5NV+6MrLVu7vKSpVG46wrgMCPSQKEi7q2iIoG
         7bY8xKE2B6tTYHPeWDpG71zl3llNpDSBzz+yR5Nk25DRiYx0+7qgRw++1nhdoYLjka9K
         us/X8tYKsJWdX5fwtJuD037o8Ixpd19VfMBCBdmBi2ZP9euAucOKdLtXTfv5M3/rFObx
         j4ZQ==
X-Forwarded-Encrypted: i=1; AL+hErH4Q4b40jQ0jhJTdH832q5gXtAt4xONh0iUZ34HMWX+Qmj6PYi1Wt8aVHetVd+FaF2orCSUFH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zZAidzmw91uolQwnVe3AwXmPOWHmzzRdbkjWMMAm7IJPMmdj0
	k3adUgwu3JEGBl53VlypIsbCB4qkGutDwIP07YXoQSvfz0KcRkXYcjiH
X-Gm-Gg: AZFdTZe+vKKZv2N1vEZvdB6pXFnAqczEDaeSpb2AQqgZuJNUDXSx9NCucAbJtJ8E5c1
	MjG52BFW5NCbSAJtu8kOYrVsSHxWi4oz94aYRWAsEJOE6xFlEQLG3cAbSjECANvJ0sme47k04MW
	IDcAMXwnrwfXQHiq1cZvcX7wC5lePJM1Gb4C0YbkqNalW0cacbp0XpPfRJE6NOP44onUu7O2ZE8
	KxToWixGQoDuVrEIBf73NZhUCgW/ukpeP3dnzhY17Aje0DKzNxvIbezIumPsJJ7V/dY3IRyMhDM
	L5tapE5arDSmv6q1I+FlJQe5193HhtEQhFS8wD88iR4W29k7TR4bX419gVwW0pmKtypAj/mQZ/e
	37Jx/ZtpXgrChM6MwioHQs5NPQru6Is537oFMJiCdIAGHdNyAp3cNuIFeTi2M/4Tj8GCZCfvfw1
	R6MKWxV8bFsHGZRSjgx++fSljtos9x1FRNpNqU35Ew2ycS0Moj0s9WNytYT/ZPo1CRkPbC2kuIk
	BDEvPXaLYbBaxZvgGHHtxSeUwQbs1L57VcC5bFZw5/E+KoG+GQKeR9DnKh4CNOa0Jxu2JuCbZRw
	YmmVDEVmru67H1N0vNm+uVGTRLasymxsv9sMGSZcoPpUbKYgPhxUMuLI6OpkYkBYgYZ9VdX5zC6
	E7+LqUTErlctQc9Bz3XjHl01LkiYyVLIva+b9egMhFmPawfKo5ZCjeyI=
X-Received: by 2002:a17:90b:4488:b0:3b1:96fe:f5d2 with SMTP id 98e67ed59e1d1-3b3d082c2admr4689543a91.65.1795050990735;
        Wed, 18 Nov 2026 17:16:30 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b6fcfsm641546a91.12.2026.11.18.17.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:16:30 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:16:30 +0000
Message-Id: <DMYSGWL8247Y.DQAGO9I6EPK3@gmail.com>
Subject: Re: [PATCH v2] net: sock_reuseport: check program type on the
 migration path
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Shihuang Liu" <shlomojune6@gmail.com>, <netdev@vger.kernel.org>
Cc: <bpf@vger.kernel.org>, <edumazet@kernel.org>, <kuniyu@google.com>,
 <pabeni@redhat.com>, <willemb@google.com>, <davem@davemloft.net>,
 <kuba@kernel.org>, <horms@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261118153541.172499-1-shlomojune6@gmail.com>
In-Reply-To: <20261118153541.172499-1-shlomojune6@gmail.com>

On Wed Nov 18, 2026 at 3:35 PM UTC, Shihuang Liu wrote:
> A BPF_PROG_TYPE_SOCKET_FILTER program can be loaded with
> expected_attach_type set to BPF_SK_REUSEPORT_SELECT_OR_MIGRATE and
> attached to a SO_REUSEPORT TCP group.  Closing a listener that still
> has queued children then runs it with a struct sk_reuseport_kern
> context even though it was verified against struct sk_buff, which
> KASAN reports as a stack-out-of-bounds in ___bpf_prog_run().
> Reaching this without CAP_BPF requires
> kernel.unprivileged_bpf_disabled=3D0; with
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy, the Kconfig default, the sysctl
> starts at 2.
>
> reuseport_migrate_sock() decides from prog->expected_attach_type
> alone, a field user space sets that does not identify the program
> type.  Require BPF_PROG_TYPE_SK_REUSEPORT there and in
> reuseport_stop_listen_sock(); socket filters still work as
> selectors, so the selection path is unchanged.
>
> Fixes: d5e4ddaeb6ab ("bpf: Support socket migration by eBPF.")
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> ---
> Changes in v2:
> - Fix the author identity in From: and Signed-off-by:.
> - Mention the kernel.unprivileged_bpf_disabled dependency.
>
> v1: https://lore.kernel.org/all/20261115152408.48205-1-shlomojune6@gmail.=
com/
>
>  net/core/sock_reuseport.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> index fccbdd0430b059..9ab76697a794fc 100644
> --- a/net/core/sock_reuseport.c
> +++ b/net/core/sock_reuseport.c
> @@ -460,6 +460,18 @@ void reuseport_detach_sock(struct sock *sk)
>  }
>  EXPORT_SYMBOL(reuseport_detach_sock);
> =20
> +/*
> + * Only a BPF_PROG_TYPE_SK_REUSEPORT program is verified against
> + * struct sk_reuseport_kern, which is the context bpf_run_sk_reuseport()
> + * passes to it.  expected_attach_type is set by user space and does not
> + * identify the program type.
> + */
> +static bool reuseport_is_migration_prog(const struct bpf_prog *prog)
> +{
> +	return prog && prog->type =3D=3D BPF_PROG_TYPE_SK_REUSEPORT &&
> +	       prog->expected_attach_type =3D=3D BPF_SK_REUSEPORT_SELECT_OR_MIG=
RATE;
> +}
> +
>  void reuseport_stop_listen_sock(struct sock *sk)
>  {
>  	if (sk->sk_protocol =3D=3D IPPROTO_TCP) {
> @@ -474,7 +486,7 @@ void reuseport_stop_listen_sock(struct sock *sk)
>  						 lockdep_is_held(&reuseport_lock));
> =20
>  		if (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_migrate_req) ||
> -		    (prog && prog->expected_attach_type =3D=3D BPF_SK_REUSEPORT_SELECT=
_OR_MIGRATE)) {
> +		    reuseport_is_migration_prog(prog)) {
>  			/* Migration capable, move sk from the listening section
>  			 * to the closed section.
>  			 */
> @@ -644,7 +656,7 @@ struct sock *reuseport_migrate_sock(struct sock *sk,
> =20
>  	hash =3D migrating_sk->sk_hash;
>  	prog =3D rcu_dereference(reuse->prog);
> -	if (!prog || prog->expected_attach_type !=3D BPF_SK_REUSEPORT_SELECT_OR=
_MIGRATE) {
> +	if (!reuseport_is_migration_prog(prog)) {

Looks fine.
Which tree should it go to?

netdev folks, opinion?
I'm fine whichever way.

