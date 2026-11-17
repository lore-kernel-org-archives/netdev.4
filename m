Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794879042;
	b=zvT+gM0vvfIplOOGMn0Qwgj/PD1oGANHln85GL8S3jxBBtrUKEASHPn+8JZpX3ancfFs
	 4N09CYbaOXCps9bdTLqJQQlXnHju8PgQombUw4fDFGRUgQRZKMNayWdjo6/Q0683Ti3SH
	 fO7IcnMeMpovLuuw2HxvkjLpnQNsUdUpqPL9Ww2BuprciPpxPqn9iZUncWQ+gyyvw8cLq
	 UpDz/nIU+OqCchzEz08CDM02yDZfnqquJ24nieQAVPaScGuUfEr5qeXvYIMgEPu7uRAx2
	 HYc1OxqnQNklMwZviZz2FkdeGqEyPQOyDpICqYtQKXNCM2nCN/rNYaqzheaTLdz5L5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
	b=fOAycYpb66bnB9kTsEBY42qlAcKg0Oyi5wotxAm6vSZ+D++TDmJbpg+i/+YpOW2eH3kV
	 uJnluX4wlo6C0Eo5HHARz9nuutx9lfNGZymmeTsn0nxR76prCxl/B21vcPGmmlUvpZzWC
	 cwg2hJeLcQC4XQr1Wh08H6coB884FacTXhXRTlGT4S9w/KR8/zSL2X9kyGHF6kPjFlrwX
	 l1A3dzK/WoibPdqhNWt/0CV3m3fXsX2d49wFjtk3nBWEFX5UtxbDBBR5P2oePEcJnhLS0
	 EDeLWOLvXMrRQMs96T1yk9dQFp8VSyFNVLnOk6JIIZTRW2iayv09E8C3UVk1nGbdkKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4sYMCym;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D29606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D29606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G4sYMCym
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eadef147ffso4444217e0c.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794879041; cv=none;
        d=google.com; s=arc-20260327;
        b=IpiebwiLmXNBUMbIzmAixgSJ10RsPBr6fXMqMfdMafu+ynlLOkgveJSyYxZZq7pbzT
         fhtKDctAiwEEkJpmwkbgS9ExJSvk58JqIL7bDvGlpKSoRYh+wIrLjrLK4mTYmR79OIK3
         4uJ/fjjzChM4Gw3UKxJOrlPHYfDQJYHi0pQnzYfG4V9qu7U0h6q9q8qeO+95TCCIKqW1
         NZWGI/bHODnLmChYyCcnYFu2GMmlNYvXD+ZzLFa+tOkWAdbVVBnoornX5TXRNfdHYPVh
         f3kjskapeQakPzYXFAuutUwU4J4ID9ta50GUkxMit1VKTKp/lOpTbQVyPHxGfNxiF9vv
         zBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        fh=Dq6EM65QTmOiOKbxdvB0aC1gxN0C1E14+790eYjXiWE=;
        b=AeuuJgaPX6cU1dYPGQqD2x2D6REnhbU70p79MA1e3fxzvzIHCw52p6FB+pSmdnBhv5
         1qEXhqN7UL/9tqCqa9p14kPILM/homKva0nsnDSP8JAzGWoj+xy/UaR3e/n6ulj2qAMV
         R2sxc54TKSqZyS71FJiTjIUsmHbxmsO0Y5GPaFmFrK0iH7BAcvebiaD3wadcSdzTiX++
         j16ZgQrI9w3YEJQKhXRdZorB5sss17lJFFT3J5L0H72AO7c2Q1RVuQz2b9Pk8IDUU6dF
         8ce0Rvt9x9PJNX9VEyvbPoSXntMTnssg73cYYA3OyMYXmwAPvBUPqyMG/RbcwlIbe63+
         LsXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794879041; x=1795483841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        b=G4sYMCymILpacviV7mjCOULNLDF3rKitytNMchDzU/yEFfaNdgaoTdJvm9yPP2LP0S
         Xh4bw+3IZR6wZDfD8uagDzYrh2q3JsGJw4ULl1l7gYqQblNn+2A2hQhLxT/TnWnvWFF+
         8lWCNnxcNTcCFWSTVsWEe7MohD2/jrgTeNizfAZyJwWNYfR1cEOYcr7zTcZaNbK3t32p
         YA5tdoLasMWMi5DMuHyy0tTcS+i+F7zvxLjbiCRyEFeKfMHb4luMG0cunaEbKKX7h5Vc
         k+sSZr56on6kqxWzPzvxazbeHu1jrsL6giLqWzinjnJ7F+68d4CIHK42jG19QVxAasX+
         whFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794879041; x=1795483841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0foDh9lhfm067jv5RbQ/CuCGBEs3f2iWSqlNDstz5V0=;
        b=oehNusxjYtqFvxJ3lcZJz/FXXDtgV+nL0dR8i4hky78dWHZyFd6jMiXCsFH3MeKazl
         roX+K8BojcEhAgvWL2mG/j+6Sw12HyKLn/RbLwpS3P88mWKJQKZdFd8naW/JCqMAfZvw
         t+wITXrWe+fUyOOY+sXh8/VpGydVNEhp/fZA25Ho9rJwTYX43/WPQUuQLFJJHd7yL0nu
         8Db9NWFeZRMSVzxonYcXL19M0PUTuMelNuf6+aRgywCDrc6YkAkONI5Zct5VLB9HbGrg
         iE0eqi0iFRr3uYCJxhnzCsRJf+OlWPqNweg5qdKKD0Aga3+FDwJ6h6X+N8N5QfUVV5jR
         y79w==
X-Forwarded-Encrypted: i=1; AL+hErGeQ0c5YE3TajBQLstmVp3hr+6llvPKnSsJF8x4LiPDlntZaCW5UZ1nTFT+CUfgNpx3thM59tA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DSh/5IB9+O4751cutNYtPEhNMH/k8NH3YK3BY1gb+WCDzinWV
	FIs3YWnvUhac3wqdzHJ6nHBbckyG+53eDY0VxucMw8hStA1dQrKbqVYmQAioEh0jshvOijx/Alv
	Ab+WzyLb6rpI8qfRjeWccrQalOggUj/lgl49tfA/v
X-Gm-Gg: AYBFou2Do3gVQOfnHAX0av1gMSJNlG7hoYYZDJCQjOOomj33xhP/OR6Eef7ZwU1QOTH
	efY/ImNcmoclZ49Rj5ECRkv1hIdZeBD8QE37aCJM40FtsqFl46P5NKLWQ5swbCLAasmBZs+JtEL
	WscjMlnKZXRiFD8jDOQ7BW5oyWgDTxgukJbNSPsmuntmLhpNy3jgIOumGE1QyuWwBSOrs+ETB/T
	MExn9p1kzuysm/A9vt3V4d1mM6GkgdcGr7jGh1lTemdAqgwjzpmdX/LFeJQVQ8Q35kQWNui8FyN
	I5FlUXS4cHM1O49InhIea44A/guj3wS63VRxCbpTyI7Ihzd21fexHn1CGInwTxxQNTUEBvrBN+U
	kT5v8haGiIdAuo5byR8eFrQDh3Cnp1RzTdyrCGv6Xp2thTZiN5kK49laY0rRKP/HN67kfaIo=
X-Received: by 2002:a05:6122:29c5:b0:5ea:cd69:7cda with SMTP id
 71dfb90a1353d-5ee34a4a22fmr4937364e0c.7.1794879040840; Mon, 16 Nov 2026
 17:30:40 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora> <avanVkILHDYdpond@fedora>
In-Reply-To: <avanVkILHDYdpond@fedora>
From: Pin-yen Lin <treapking@google.com>
Date: Mon, 16 Nov 2026 17:30:28 -0800
X-Gm-Features: AclHuK-byOO9ApLlxanSDYI9Lfieig8sHZUQyc_p9n6pRaoz5hWdciXbyY9EdzA
Message-ID: <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	Jonathan Toppins <jon.toppins+linux@gmail.com>, linux-kselftest@vger.kernel.org, 
	Hangbin Liu <liuhangbin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hangbin,

On Thu, Nov 12, 2026 at 10:00=E2=80=AFPM Hangbin Liu <hangbin.liu@linux.dev=
> wrote:
>
> On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> > Hi Pin-yen,
> > On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > > The prio test intermittently fails in the arp_ip_target and
> > > ns_ip6_target variants:
> > >
> > >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [FAIL=
]
> > >     Current active slave is eth0 but not eth2
> > >
> > > The ARP/NS monitor marks a slave down when it has received nothing fo=
r
> > > too long. With arp_interval 100 and the default arp_missed_max, that =
is
> > > about 250ms for the active slave (eth1) and 350ms for a backup slave
> > > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the repl=
y,
> > > and eth0/eth2 receive a copy forwarded by the gateway bridge. Once et=
h1
> > > is down, its probes reach no one and no slave receives anything, so
> > > eth1 normally times out first and the new active slave is picked by
> > > prio:
> > >
> > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > >   t=3D10   test sets eth1 down
> > >   t=3D300  monitor: eth1 idle 300ms -> down
> > >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > >
> > > But the test takes eth1 down right after bond_check_connection(), who=
se
> > > ping replies only arrive on eth1:
> > >
> > >   t=3D0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > >   t=3D70   ping reply on eth1 only
> > >   t=3D85   test sets eth1 down
> > >   t=3D300  monitor: eth1 idle 230ms -> still up
> > >   t=3D400  monitor: eth1 idle 330ms -> down
> > >                   eth2 idle 400ms -> down too
> > >
> > > eth2 can then no longer be picked. eth0 becomes the active slave if i=
t
> > > happened to receive some other packet (e.g. an MLD report), otherwise
> > > whichever slave comes back first does. With primary_reselect 1 or 2,
> > > the bond keeps eth0 even after eth2 comes back.
> > >
> > > Before taking the active slave down, wait two monitor intervals
> > > (200ms), so that at least one more probe is sent after the last ping
> > > reply and all slaves last received that probe. The miimon variants do
> > > not need the wait, but the extra delay is negligible.
> >
> > I'm afraid the waiting time is too strict, especially with a debug kern=
el
> > since delays can happen.
> >
> > Bjoern is also fixing[1] this issue by pinging a non-existent neighbor =
to
> > keep traffic flowing. Would you like to test whether that works for you=
?
> >
> > [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@amazo=
n.de/
>
> BTW, using ping may not able to triger the arp request in time. You can t=
ry
> arping instead.

Thanks for the pointer, but I believe Bjoern's patch addresses a
different problem.

Bjoern's patch keeps the traffic flowing so that idle slaves are kept
alive between the test steps. This patch fixes the case where the ping
replies from bond_check_connection() only arrive on the active slave
right before it is set down. The active slave's failure is then
detected one monitor interval late, when the backups have also timed
out.

The ARP requests triggered by Bjoern's ping are sent only about once
per second, which isn't frequent enough for this failure. I tested
Bjoern's patch and confirmed that it didn't fix the issue in our
testing environment. We also can't simply use arping instead because
iputils arping doesn't support sub-second intervals.

If you're worried that the 200ms sleep is too short, would increasing
it to 0.5s or 1s work for you?
>
>
> Thanks
> Hangbin

Regards,
Pin-yen
