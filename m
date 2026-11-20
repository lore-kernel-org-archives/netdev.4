Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156295;
	b=kP9dnFuZXRtuHFaLTPwSOQONgwHuaKtbp9bAf8OstXhZi7H2B3eVZwOiTKNdwiMcnQEB
	 gyL5tCUiJBVMQgoOqdwcyDWpQ1x9SFC0SV2H+3GtaGgOesBpYQQ1D7F7+aUWCmgsrOec6
	 /BKrfOkiwT7axK2zTx8hDO/m25BHV8EX4024jm0+tTe6yJI1SHZSKvSTy07j4qr8SI8P4
	 CQduZE69ncnqLeMRRNVXHVgQKG9R2a/OsBp10Qivaa0ZhxncIZSNSeGzd8SMbOI+1ngrJ
	 mY7TxC/trVinarOdUkgm0Ehb6iG8iYKsUgPX59Z0eaOgRNZrfLrRy8ePa1kHdSY9cXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nh742ByQH/1quHeImWf6wWE+2ccrZW1HZWhzNKYxO/8=;
	b=tsI08yRBQ7dDSBGN9tmt/YhM/Ez0z3/oytN0YFF+C/u2q5BXliOuaAEA0o7tFbYYlkWX
	 eHyl8kbUBxpe2JC52PVXYSaxEBk6xaK3ML7VefrJsI0B6RbgfZBu8IA8c/AZKC/JopJnn
	 B65SbndUrGnl5gE37XRBkhIG7hA3QKn/qJb6ym873VH/AA/Ass6MWrKVdtlkdKkAIP3Yh
	 KxmH58YO1FWkJbvczY6rMXzFG+SZMjI58zBZNGeJwSVdsXb/qIuYJAXZEmImF29wQnWaP
	 +D5gIWKIiIoi74uziKtvZx5l0hEGi5vVL0drqHxjvJPWa0MN8vKeri6+958LZQ+IgUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=cZrcsihk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635CD606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=cZrcsihk
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8F24F53011
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795156292;
	bh=Nh742ByQH/1quHeImWf6wWE+2ccrZW1HZWhzNKYxO/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cZrcsihksYqqEPyXDsVsG4zPMUNt3fI9sLbz+1Qozve1HKQMV9Z7w/POGxS2IgG5H
	 qJvAoDUPLKo4WhNmiqj7pcFxKGFJz/g2sVcjmoB9xkMIpv/XD4vYeALpwVJ5KyZo1Q
	 uCxfehPxVT2p9XpyuolMmygDVisK0dm0CKb2XJA7ssh855LiawR/sB1/tJ+x+oEKiZ
	 onCOcuzT80k7I5USZMPaCn83nUDfpHMchw8XS1ixuxIF+QdSssiFLibicgH/SioMAG
	 a2rvIRU7n0BjHXQ8ulYhV5ew6wpo/XFGoon/j6BN8ITxjO0XRmGm4ludR+CWVKLYTJ
	 vPJk2Xngsyb5Ql3x9M2KH+Bw4b8rxxcA7+m3sypAuTfP+cgssRocoF4YxwBjWsjAv3
	 S0yF2b1qv9tL8JZolBCDGYSQ9pVn+22M9Ka21I988Ipobn67K3huu1cPVmNBM/xezG
	 yJqZjavMNEM46a2kxM7K6p30KKjqnyRK4ZubrxDXWrz+PHaDfkITL0+SB4+QIRVpvD
	 sV92d2eqgggN8cQuKRW5XgEee/eFjl4vGofyNswHEg+WMKIIsb8F/JlHvCF1c8Z5fV
	 GDiyVrjWtjkXtTyDXuZ+3IAud9OQjMrhnOv42uxVcqWYlpJLUkZ/1JwP790/g5k6UX
	 VUrtpAxP6kv5GIjNpHQQ6MCc=
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b889512a64so605196a12.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795156292; cv=none;
        d=google.com; s=arc-20260327;
        b=IUtfBZTIGejvl4FNIKUVDMP+HWNh/DB0Hj+qVHazE6Iio8noY/lQh0ICpC9mJMjQT6
         yvwd23ulH09A+Afydi77Y64gVcPxr1oL//6Pgce4ZjsF+EceBI5H5kjkixqhtX+yRwLv
         VoKZ0rhJNxLBzmrWNTutwxHpBrnYaZPRZkfClWNw27VFwRHQgigh+XsAV7TCKPoUp7XD
         IRw7aHO1vLQAQSroD3hoc7jbHW3G6m65AAfI5/OqmJOLcpV4mp6rbCVF5aSuAZsdhnyq
         riLXtatB0ZBMU0PZVq/4feHEp+pknfISS8EiGWLZ8EEk+hpsGML3WbYG0YzVMeJs3qh1
         XBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Nh742ByQH/1quHeImWf6wWE+2ccrZW1HZWhzNKYxO/8=;
        fh=YCa3sKZ2Ri0DRUJ2lQqwm10h9nypeS6w61Ox9b+h5hI=;
        b=KbSWaatP4k3AiQ/T6Z/xLdPiPa79xovjzY6fDei1qsboHUZYidKsovBuv92mvxT5zB
         EO1RB1L4DuD1/eh6t+dhZdzZrylz7MM+vYB1Jt4UCGoyrvVewBOWsjYgRBIGkV1nQAs9
         g3GX2cLt2oS691yZ8uco6krfWBrqRjroaPFOScYlyGZplwcRAkxE8HOpUih6AJ2qQCG0
         29tBF3pk4Ce+H6IA88fBqxHZeB6+xnL7TYILTiOJIn8fYjGi0yZjDv/DACRqPbweHDi0
         x5r2Ei/zJ0XSaei8kjj+gHiL9qyzVrFZ7/s96KC7YeTVL3snY0+s/10bphwXIfWxbyBI
         Jk5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156292; x=1795761092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nh742ByQH/1quHeImWf6wWE+2ccrZW1HZWhzNKYxO/8=;
        b=lrOpmkLso/4gHrbFLqDcNoCJOQC+rs09T/c6aAaI1p9hNkTLbCyVxq5ZVUL150iVfV
         c9xnWvpqXj7bw/PIb4YACCNTTpomNbkkSIlOElzOXCiwkV0QMlCnqO3VmofnHTC5HX4M
         x6qFc21WIZVJ1LHWKjHfbXC9IwGhh6FnMUfsKdB05QLJCQjaqfX4MXdSQYsyHXuyWS9e
         pXza08p0hIzAKYr02tFDcx88EJ7fAeh1eVSielebcFaRCj/iePKRTPPrklzLBF6KiIL2
         cGjpOdirhlKca+O0s4tte0w/cjOaUyfFOl99hYHf/ZQNydjTjnvOM53S3wx8DiWh3++Z
         F4fQ==
X-Forwarded-Encrypted: i=1; AL+hErH3vP5uIo+COcwdbSGXsMklUXLaWuz4m+zZGiEfwPQZPvQ9tgh3XpTcXqofeyU1JlMaLrZ3VRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BQUtde7v5yetGXRtkB7KFETa67ujNb8pLh3FHgQlQsq1lF4zv
	v4wb3kmBpW4VBPBqWdgQDMgKkQTVViyEl7/XICnsNCzy1jEys+W0xr8zi6GbvPlOuBe829AlVOm
	yIPjVJkMNGJWDnSbJkWLqxQNM4R3PvWdSt9xXBChECBcglRSZZRLScjpH4CB2mL3WSw8hjbnlR2
	UXpYvHbmtPXTFNZqylTLq2aO8h4U7dzqSIZ9KjvvNoONRaLyTITHYEzUTU1kyppw==
X-Gm-Gg: AZFdTZe2Kbff58f0SwlPqsEMgW6eKZB9osh2VQeBcEDi2mJMIQNnp1ilmlfJmK60m+T
	RvFiPsUh/8c0zxbFjZjml85O1KjFI8yKRXoyuDsFnRNIjJSfuQXwsieWnj2j1+nVjjULrT2Eskr
	l4pKT5OFiTQr7HzDoyLHVswfh1KrlorlJr/jLfylJsloPm+ZVmkgy28WQsVQ==
X-Received: by 2002:a05:6402:23d0:b0:6b1:b97b:744 with SMTP id 4fb4d7f45d1cf-6ba37ec18e4mr1046106a12.32.1795156291967;
        Thu, 19 Nov 2026 22:31:31 -0800 (PST)
X-Received: by 2002:a05:6402:23d0:b0:6b1:b97b:744 with SMTP id
 4fb4d7f45d1cf-6ba37ec18e4mr1046093a12.32.1795156291675; Thu, 19 Nov 2026
 22:31:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119100710.129379-1-aristo.chen@canonical.com> <av7fR4V6ZRUeVECC@lxl00025.wbi.nxp.com>
In-Reply-To: <av7fR4V6ZRUeVECC@lxl00025.wbi.nxp.com>
From: Aristo Chen <aristo.chen@canonical.com>
Date: Fri, 20 Nov 2026 14:31:19 +0800
X-Gm-Features: Aa3M54qhqEB_l38Nf4wHPeGV4PuVD1kQCrLjMr-9-2te0kVMF_cMIz0K3wuBVM4
Message-ID: <CAA=k7==EoSz5ARvCp76H6sDZ=ic2XGqo+ee8esw5YziT-cpqag@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: felix: fix NULL pointer dereference in felix_port_enable()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

Thanks for the quick review and the suggestion!

On Thu, Nov 19, 2026 at 7:59=E2=80=AFPM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
>
> Hi Aristo,
>
> On Thu, Nov 19, 2026 at 10:07:10AM +0000, Aristo Chen wrote:
> > DSA registers the user ports in dsa_tree_setup_ports() before it sets
> > conduit->dsa_ptr in dsa_tree_setup_conduit().
>
> I wish I had seen this when writing commit 11fd667dac31 ("net: dsa:
> setup master before ports"), because I later had to revert it in commit
> 762c2998c9625f642f0d23da7d3f7e4f90665fdf due to some unforeseen MTU
> handling complications. Had I realized the conduit->dsa_ptr
> implications, I would have tried harder to solve the MTU stuff.
>
> > On teardown, it clears
> > conduit->dsa_ptr in dsa_tree_teardown_conduit() before
> > dsa_tree_teardown_ports() removes the user ports. RTNL is not held
> > across either pair of steps, so user space can open a user port while
> > conduit->dsa_ptr is NULL.
>
> Correct, even though conduit->dsa_ptr itself *is* assigned under
> rtnl_lock() since commit c146f9bc195a ("net: dsa: hold rtnl_mutex when
> calling dsa_master_{setup,teardown}").
>
> >
> > In NPI mode, felix_port_enable() calls felix_cpu_port_for_conduit().
> > For a physical conduit, that function reads the CPU port index through
> > conduit->dsa_ptr without checking for NULL. This caused an oops on an
> > LS1028A RDB when systemd-networkd tried to open a user port while the
> > switch was being probed again at runtime:
>
> Yeah, I think this isn't the only problem. conduit->dsa_ptr is accessed
> from the data path as well, so IMO patching place after place is just
> playing the whack-a-mole game.
>
> I realize reapplying commit 11fd667dac31 ("net: dsa: setup master before
> ports") for stable kernels introduces a high regression risk, but what
> about this change instead (not even compile-tested)?
>
> diff --git a/net/dsa/user.c b/net/dsa/user.c
> index 041f9060c8ef..c68ed0389404 100644
> --- a/net/dsa/user.c
> +++ b/net/dsa/user.c
> @@ -403,6 +403,9 @@ static int dsa_user_open(struct net_device *dev)
>         struct dsa_port *dp =3D dsa_user_to_port(dev);
>         int err;
>
> +       if (!conduit->dsa_ptr)
> +               return -ENETDOWN;
> +
>         err =3D dev_open(conduit, NULL);
>         if (err < 0) {
>                 netdev_err(dev, "failed to open conduit %s\n", conduit->n=
ame);
>
> I know what you're thinking - if we refuse bringing the interface up
> altogether, won't that regress user space and be even worse than risking
> race conditions with dsa_conduit_setup() assigning dev->dsa_ptr fast enou=
gh?

I tested your change on the LS1028A RDB, on a 7.0-based kernel without
the felix patch, with systemd 259. It does prevent the crash. The
conduit was already up in all 10 runtime probes, and I saw no oops. In
10 unbinds, 28 opens during teardown failed with -ENETDOWN, and the
other 2 found the port already gone.

But networkd did not bring the refused ports back. In all 17 runtime
probes where only networkd tried to bring up the ports, swp0-swp2
stayed down until I ran "networkctl reconfigure". In the first seven,
they were still "off (configuring)" after two minutes. Only swp3 came
up on its own.

In four debug runs, networkd logged two -ENETDOWN "retrying" messages
per affected port. Before it retries, networkd checks that the conduit
is up, but not that DSA has set it up. In link_up_or_down_handler(), an
-ENETDOWN reply to the activation request makes link_up_dsa_slave()
queue an "up" request. If that request gets -ENETDOWN too, its handler
tries to queue another one while the failed request is still in the
queue, and request_new() drops the new one as a duplicate. That would
explain the two messages and why the ports stayed down. The handler and
the duplicate check look the same in v262.2, but I only tested 259.

So the core change can leave a port down if an early open used to
succeed and user space does not retry after DSA sets up the conduit. In
these tests, networkd did not retry after setup. For drivers whose early
opens work today, that would be a new regression.

I agree that the packet path still needs a proper lifetime fix. The
felix patch only fixes the crash I reproduced. For a physical conduit,
it checks the user port's assigned CPU port against the NPI port
without reading dsa_ptr, and it leaves the LAG check unchanged. I also
checked the open path and the other drivers' .port_enable callbacks,
and did not find another place that dereferences conduit->dsa_ptr
without checking it. On the same board, all ports came up in 117
runtime probes with the felix patch, and there was no oops in 10
teardown runs.

Would you take the felix patch for net, to fix this crash without
making early opens fail in the core? The setup and teardown order could
then be fixed in net-next.

>
> And the reason why I think this alternative change has a chance is
> because of DSA history, where bringing a user port up had as prerequisite
> to bring the conduit up first. I removed that dependency in commit
> 9d5ef190e561 ("net: dsa: automatically bring up DSA master when opening
> user port"), but user space still has code to deal with this for older
> kernels. See:
> https://github.com/systemd/systemd/blob/v262.2/src/network/networkd-setli=
nk.c#L1081-L1082
> and I'm hoping other network managers than systemd-networkd have similar
> code as well.
>
> So I'm just proposing to play dumb for a while in stable kernels, return
> the -ENETDOWN that used to be established practice, and buy some time to
> do a more proper reordering of the setup/teardown in net-next, which
> gives us the guarantee that we need that conduit->dsa_ptr is a valid
> pointer for the entire registered lifetime of the user ports.

Thanks,
Aristo
