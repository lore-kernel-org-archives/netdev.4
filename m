Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071584;
	b=veXtBjCX4JNReFMNPd5N9qEPSyTRlzkf40Ciu/cUNnER/pYdVMgsniSumlP+CjXIcG5a
	 7rcHFBkI7UcrrohYhZyaixvum/QenMzzyQTtJtMWmm6bkcNjqj8Kp64PPVyImY1uZEwxZ
	 A3eYNODLUKgKV0kFr8UwnjXzUVjfxGsaHsPh9PnRdF7TCYd4P7NZDt2pTlLKquvUznrwo
	 NlBc4biHO56TpjUNQPBLAziFZli/IMdU8Mh0sKpy5KXbnBvM/T7WTcBmeUe80hYdL4eup
	 U17NyGhv1kE/+4lGVSlkKDwuSME9Zu5lN61kjRN9CCA9H2vyxvkU5T+VMSSyozMsTkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=X0WRwwJd1pZT1/asGrjlV793C83Yb9lxDv3dSeiemCY=;
	b=GZ+fopyrNgLDzbgYQSwvMMNgT5h0Vof1i5HsEhck1Chv6jRuWkhr9DlFRSvaNJT1zMu8
	 9wc5Uf7yruECHhOmAJ2I2Jbpl5cepnBcvW8WJvnB4Fhfd1FhPRGS14qEgKgzdvXbuXgby
	 IafWzDeE49XfYBp9rg00wKmku89Y2k7VnDAas/vcacM6pUX71yAdWV9UtHeWx91Xcs6GV
	 Bf6a7xDGmH9AeuD1IZBiAtFALaadaBDRleOZ0Y7Z64Rko9umsMEF2GT1sMGQIw9vU6gB1
	 CtIIpV8hJnhxHhC9lCRWfhkyS5JcdObO9QsvR5IIug5TCO0sVdMLrpynwDxFRTpf32g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CfefhvgJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F7260A2600
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F7260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CfefhvgJ
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1343090a12.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795071584; cv=none;
        d=google.com; s=arc-20260327;
        b=XGCSmGHjXBLE2Cr02xJQ92YU9y6gLyGo8LXJLOkE8dOObIpSvae/wjCxOQvJ35wn2X
         Oc0w4dG4TnHZRg8/J0s3Qw99QRMms2oZPUZNQfHs/CaEFmGHiQWuiuoXuSADs1Aeewhw
         a4iCBzaSMpAXRxoLgfkECI0j4s0tHTK8txF8RtdkYAlHQT/V41KrSRqhi9dyRvxqsZ1k
         ANQHJsfROkdDoNmQ3eHKymTgjSf+rxkfu8EXdom1EOcArB+voSAd/Gq7hvd6yv6fOTWR
         upEjc0J/H4wYq0gvJtV5T2QaR1T4we/nxw2xw40P3k3b7AEwxXAKibdFuxIVj+7bV4V+
         37UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0WRwwJd1pZT1/asGrjlV793C83Yb9lxDv3dSeiemCY=;
        fh=13K5dNbYgOnHMsJ6n17QQv5jWeh4G3HK933Vm5tWL0g=;
        b=pYvke8IFQ6iszV2n5omKJYPEx0x4R7o4/BijaTBAsj3/ICSzTaubva5rRnOHMp/d78
         TJAWLyHGMhGeVjXveUpmKG6FAYkMl3/b6GIl20oqYuZXMbDwtNqfc8b/SxJ7A8vcWDLn
         4XFe4zQozh4N5nfFG3O2jxJLH5PV21X09njH9+Drv8ASw2qFTlDEcGv9RjAfz79/ZsvO
         WiqLZ/J32H2yKmx5l/jMdoNZtMMvqX/4rhnOusAx5D/HjLpI6lGT6esLL2yThZI9fK5q
         n8+CVRdzYCYY6+nUoln+MsLGS6l7CqMem3OgPky7YxfbDtFtO+PJbPkdYF0C4uOw1ais
         lrZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795071584; x=1795676384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0WRwwJd1pZT1/asGrjlV793C83Yb9lxDv3dSeiemCY=;
        b=CfefhvgJKboZ4DCkGtAZ6foSmOAIxCHUgayvLTdqAAOjYG0/2C5N7ZZguVUjLRKkSa
         ee4e6auDggLchvLQ1CNIpvJGvY1bJGQ04/F+aHpGIw6opujN6EAf3c79JmagEZOp+IQp
         S5ZenmrAN+AWERADuvNt3gjxgL0LOoG0yFc09l/NRfzI9KlK7lGGMpGY/piYRO7nRNdG
         KRov6NznqPXnzPVlsyC5nPiVqmlpUGEEePUtN4ixRpJHftSt+qAL+1L2olsqxCJwYBhC
         NVtj8t2s7wDWuuXA9ji1kw4uicwmVZgFtRkEsj4tmn73H2HwgW0rjMn+5hRmdWI9duf1
         tjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071584; x=1795676384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0WRwwJd1pZT1/asGrjlV793C83Yb9lxDv3dSeiemCY=;
        b=QxXffNAhVxgDmQ/CSsDY/jDSBi+nID38iEfz4VDKs5mQFFzr8FXCkdcQusbXWQNwlI
         3Gaf4QaR+9vppmYnUEnT26guNEjKlvP5yVGbhiSSIoW6qFeggr8XITAq/DGCvwGAWHR6
         5Gl3rOKfkYSjGSA8FhRLP64A5H5y4yjCxV7RoYtwWhrRwiI2fUC0oz4ilUBAWzNbxwb3
         eht0GHFW14WNDdCrh16ZTG5XZf3g5C/Z8Uy1m9qVSGHBNx1Uxes5nQCfFMi41Jb6x6Zv
         /BomsQPyM5YtWIzTNsWvcD0JD9fT/c0Nv6sa4QcSD9jr7mtiXSteTQw6iGW9BB9+Hs5M
         I88g==
X-Forwarded-Encrypted: i=1; AL+hErEL7cW+dpX4BSqYB/U0pc/tuDu+N2RKhdib99A1EyG3vXSqiisCpEt/fd/wx6ccxp430VyH4Pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PDMY4mBJsjZtKPUuPZQP/pV0NaZT3Xo4Ot939z04ONVfBmgwv
	MfDh0jTuI4ZDd4cvdxB3m5uWbfouV1XqgFCVq75/IlcbEjOYupWQSCTv/lAFp5sruFoBlBElU/U
	hGOajwBV2X8rlSnxH807vtfqmKRSIo1r90i/tKooQ
X-Gm-Gg: AZFdTZcOkuzPYdmc4SeYJZtidHP/aAe/+VNHxVV9LfFzKkY/SKqUJrA1jM6U41rEQPm
	8VKpmK+jcfpEv/aGXH+qvGeB7YfuDYQDcH4XEH5qRCXZNFDfd76ZFAIP9ZRixVLOF1nwMjokHFB
	sxmA/uP1zGhLlhpNOSGUBpP3VZLiz60yEWa5s2iBypt76QB53ljyI5zRoLpf0t+RTyEW4kHcjlD
	BFEopw/rgQvCyqmayjwOI/qnVq8sEDh8PAC6e/La1QxWkNf2l+5329GVfQP/LvyEy1p+r+l3pQW
	t6u5Yb5zspajgKPEaHWEy8r/WpL7NWYgIMy9WV02CRmVLui0Yb4EveIPQojfpVMXhHw4nVU1VU+
	rrIoBuiayjJJENrk8EQ0HHH4Te/CnfORnYco=
X-Received: by 2002:a17:90b:56d0:b0:3b0:9a2e:b491 with SMTP id
 98e67ed59e1d1-3b3d07d4e32mr4811737a91.66.1795071582990; Wed, 18 Nov 2026
 22:59:42 -0800 (PST)
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
 <avaewOJD7tX1UYfE@fedora> <avanVkILHDYdpond@fedora> <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
 <avwBrbJfp4ET9ifT@fedora> <CAHwYsiqwCVPJqtQRoP+9Uw66RpdGL4zuiCPO8+mqShxnvFgDPw@mail.gmail.com>
 <av1hWxGIlZUJDUpl@fedora>
In-Reply-To: <av1hWxGIlZUJDUpl@fedora>
From: Pin-yen Lin <treapking@google.com>
Date: Wed, 18 Nov 2026 22:59:31 -0800
X-Gm-Features: AclHuK8wS87JOe1h2N3kmc2gHdWKNu393jcuOZJmbei73u2w3z7QQLjva2_sguc
Message-ID: <CAHwYsioz+MJoFkABmub0_9QtKpneiJyi0-=Syc98zRy8KJXTOw@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 12:27=E2=80=AFAM Hangbin Liu <hangbin.liu@linux.dev=
> wrote:
>
> Hi Pin-yen,
> On Tue, Nov 17, 2026 at 06:32:52PM -0800, Pin-yen Lin wrote:
> > Hi Hangbin,
> >
> > On Mon, Nov 16, 2026 at 11:26=E2=80=AFPM Hangbin Liu <hangbin.liu@linux=
.dev> wrote:
> > >
> > > Hi Pin-yen,
> > > On Mon, Nov 16, 2026 at 05:30:28PM -0800, Pin-yen Lin wrote:
> > > > Thanks for the pointer, but I believe Bjoern's patch addresses a
> > > > different problem.
> > >
> > > I think they are the same issue, as you comment also said
> > >
> > > The ARP/NS monitor marks a slave down when it has received nothing fo=
r
> > > too long.
> >
> > This is the existing behavior of the bonding driver, and the prio test
> > uses it to check which backup slave takes over. Slaves being marked
> > down is not the root cause of the test failure. Instead, the root
> > cause is the ping replies described below.
>
> If the backup slaves are not mark down, we can active the correct slave
> based on the priority, right? I think that's the root cause. The ping tes=
ting
> is just for checking connectivity.

Yes, I get your point now. If we keep backup slaves up all the time,
the ping reply packets won't affect the test result.

>
> >
> > >
> > > >
> > > > Bjoern's patch keeps the traffic flowing so that idle slaves are ke=
pt
> > > > alive between the test steps. This patch fixes the case where the p=
ing
> > > > replies from bond_check_connection() only arrive on the active slav=
e
> > > > right before it is set down. The active slave's failure is then
> > > > detected one monitor interval late, when the backups have also time=
d
> > > > out.
> > >
> > > The reason is we set arp interval to 100ms, and slowwait also check e=
very
> > > 100ms. If the backup slave down at the same check point, e.g.
> > >
> > >   t=3D300  monitor: eth1 idle 230ms -> still up
> > >   t=3D400  monitor: eth1 idle 330ms -> down
> > >                   eth2 idle 400ms -> down too
> > >
> > > The test failed.
> >
> > I don't think the slowwait interval makes a difference here.
> >
> > The ARP monitor decides which slave becomes active, and slowwait only
> > reads the result afterwards. The test expects the active slave and the
> > backups to time out in different monitor runs, so that a backup can
> > take over. In the example above, eth2 is already down when the bond
> > picks the new active slave, no matter when slowwait polls.
>
>
> My idea is, by extending the arp interval, there is a larger gap. e.g.
>
>    t=3D300  monitor: eth1 still up
>                    ^^ slowwait check, incorrect active slave
>    t=3D400  monitor: eth1 down
>                    eth2 still up, should become active slave
>    t=3D500  monitor: eth1 down
>                    eth2 still up, active slave
>                    ^^ slowwait check, correct active

Shouldn't eth2 become the active slave at t=3D400? In the failing case,
eth2 is also down at t=3D400 so it can't be picked.

>
> > >
> > > >
> > > > The ARP requests triggered by Bjoern's ping are sent only about onc=
e
> > > > per second, which isn't frequent enough for this failure. I tested
> > > > Bjoern's patch and confirmed that it didn't fix the issue in our
> > > > testing environment. We also can't simply use arping instead becaus=
e
> > > > iputils arping doesn't support sub-second intervals.
> > > >
> > > > If you're worried that the 200ms sleep is too short, would increasi=
ng
> > > > it to 0.5s or 1s work for you?
> > >
> > > It's not about the sleep time before setting active slave down. I'm a=
fraid
> > > about the slowwait checking time. Even we sleep 1s, with arp interval=
 100,
> > > we still only have 100ms checking window. Before the window, the acti=
ve slave
> > > is up, after the window, the backup slave also down. With a debug ker=
nel, this
> > > time is a little tight.
> > >
> > > So, either we have some background arp traffic, or let's extend the a=
rp
> > > interval to a larger one.
> > >
> > > What do you think?
> >
> > I agree that a 100ms ARP interval could be too short in environments
> > like a debug kernel.
> >
> > Background ARP traffic doesn't widen that window, though: it is sent
> > through the active slave, so once the active slave is set down,
> > nothing reaches the backups. It could only help with the ping reply
> > race if it were very frequent; Bjoern's patch triggers about one ARP
> > request per second and didn't fix the failures in our testing.
>
> For background traffic, I mean let the client send the arp requests,
> not from active slave of server. With arp_validate 0, the backup slaves
> will update last_rx and won't be down with idle.

I see. If the ARP requests are sent from the client, the backup slaves
can receive them and will stay up during the test.

>
> >
> > Increasing the ARP interval alone won't address the ping reply race,
> > but it should help in environments like a debug kernel. I'd prefer to
> > keep this patch focused on the ping reply race and send the ARP
> > interval change as a follow-up, but I can fold it into v2 if you
> > prefer.
>
> Doesn't extending the arp_interval (e.g. to 500) resolve your issue?
> Are you still able to reproduce the problem?

Yes, I can still reproduce this. Simply extending the arp_interval to
500 does not fix our issue. I still saw failures in 9 of 20 runs.

However, with arp_interval=3D500 and a background arping from the
client, the issue no longer reproduces. Both of them are needed:
arping only sends one request per second, which is enough for the
~1.75s backup timeout at arp_interval=3D500 but not for the ~350ms one
at arp_interval=3D100.

Bjoern's v1 patch sends the ARP requests from the server, so it
doesn't fix our issue. I can prepare a v2 to remove the sleep,
increase the arp_interval to 500, and add a background arping from the
client, unless Bjoern prefers to include the client-side arping in his
v2. How would you like to proceed?

>
> Thanks
> Hangbin

Regards,
Pin-yen
