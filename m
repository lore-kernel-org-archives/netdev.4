Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427084;
	b=xlYXX6sdU3/r6NmIUVJcmMjWLZBXnEHhq68Pc0OtOKxLOHBkmZMLUXSX2fOtpIa1At0B
	 z0M0OTE3/Iq69tb46T6whKsy2UTDfBuTDLAt8wUr9O2pCdCqdThm/60Uu0/+y6svmbARj
	 b/gzJoqTt7rKCPDjJMYJjyXwTtkauX9p7rzYhk5Bl/3mUsMAKwbuQichbBg8VrBLqGZTy
	 DASH1h9Snlh2MaO6Kn0U6dQhxBcjEoaJ2juPl6AK2eD1xrG8mM/EOU6DXkmNOqz2j6TCW
	 uY7Q9X1h1ZF5PNWzIj1kdQcpJ2OCS3nOv0rNNxahA8b7RYECXJvm2McO7ub21A2N4WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427084;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kbu4mEi4TnDVonrr8uE/WKwIabaf+MsksDaz7XYQWrk=;
	b=v1NY688tIQB/hEyogx3Z8LgLKR3QtLvs8ru6oHF5gKWZDTLscNqZ023Rw5CZkwM+SDw1
	 79qK3yKqJRL5m52wPfyyRHbTlIRNTlSjdFeTZOTspyKCAPTG88qll6Ajs4XGClkT2lhgT
	 gjYXH5AjmW4zMvnxG57/OCKTeamdhudUuHoQxfRmO6z70xp70TH9vIA72ME+5K3LzOw1k
	 pVDyf3hFL+BDWiu7UyryzGoEgoLdesHptyMJKuF7jQ40QDYbFhwM1UrvByA74R+2LYVn4
	 Bqo/zlrtDs3EIaNJ/k7Fc0jIg8pZcqA1ti6zB9cfEQG6h4LtcRL3eH5ypGDbTXGp10Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkRR9pZg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FB606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkRR9pZg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232FB1F000D0
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427083;
	bh=kbu4mEi4TnDVonrr8uE/WKwIabaf+MsksDaz7XYQWrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AkRR9pZgM22SHALu/mxiNJB+/JvtfHsa9GmfcxHiSvKAM6/DcHy16Kk02U7ozvhes
	 dwub2RfozhWXKf4ecRgRx1RdDLYUQ4esmghtBs432brddsNwK9YN50PAKppI28AN/E
	 d4zAgDl70rND9TL0fsoOXPSd9nKT+vJjE6TXDOjzIcGk/xzR9tDYISfC2LMORrZCUj
	 KKfuUsK5Hkn+phW5MYjPBQR26ELGdhxXcP6g9iwhu8hcvQl/cyBuIacovlFoObCZ51
	 4HwKALjGvAwuRzZlENQ6axNsYK52h5q+HvvYQG2fUiNlb+jwBhYeUeFp4WBDg1DTGb
	 59HZVTffu3+Rw==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48ed0b68895so1981893fac.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:44:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGv9IujMrznHEi6frEMtc+aFc/AQl6azMjO2VDduR9RNUbVpJVQuQhYsTuL4HuOs1SxYainJUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TyY8qcTGhfc2wpaivogcEpmnaU5dfBn/7OsFnrraLs5llX4/z
	ZTJSAP5lvMVd8uYa8/LnEfDxytmbyVLcw1uHtT6AK8BAbP3JDCa6gFi/MiAuXQiOEX8sUd6SAjW
	r2KcqEMpdrHHw+g42C22sqbeB0IbqnqQ=
X-Received: by 2002:a05:6870:32ce:b0:4a9:5267:fd9f with SMTP id
 586e51a60fabf-4bc81b9b0e4mr10342724fac.15.1795427082481; Mon, 23 Nov 2026
 01:44:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALkdYjV9G2fPfXK7UYTe4FuXNUBYD+DbM6caVtBT3CAULHHqUQ@mail.gmail.com>
In-Reply-To: <CALkdYjV9G2fPfXK7UYTe4FuXNUBYD+DbM6caVtBT3CAULHHqUQ@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 10:44:30 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqGjJFDEWT+2NgNbLKrB0E=_jFxidEFKzqcmB5r46uMOg@mail.gmail.com>
X-Gm-Features: Aa3M54oXCu8GD-sDCUBfDu6COuaOdYYEIYyNRe6yKpQIA6ChT5EEpDKGHWE83nc
Message-ID: <CAL4WiiqGjJFDEWT+2NgNbLKrB0E=_jFxidEFKzqcmB5r46uMOg@mail.gmail.com>
Subject: Re: tcp: question about RST at SACK right-most edge
To: Eugene Siegel <elzeigel@gmail.com>
Cc: "ncardwell@google.com" <ncardwell@google.com>, "kuniyu@google.com" <kuniyu@google.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 01:49, Eugene Siegel <elzeigel@gmail.com> a =C3=
=A9crit :
>
> Hi,
>
> I think because a TCP RST is accepted if sequence number matches the
> right edge of right-most SACK block
> (introduced in e00431bc93bb), it is easier for an off-path attacker to
> forge a TCP RST since they don't
> need to guess RCV.NXT. If the attacker gets a forged out-of-order
> segment queued, then they can also send
> a RST with sequence number at the end of the segment and cause
> disconnect.

Your description of the mechanism is correct.

But note the precondition: the attacker must first get a forged
segment accepted in the out-of-order queue. This is the blind data
injection case of RFC 5961 section 5.2, and its cost does not depend
on the SACK rule at all.

> To forge, the attacker needs to
> guess the sequence in window, ack in acceptable range and know the
> 4-tuple. The application I work on is a
> distributed network and it is possible to know the IP addresses as
> well as the listening port. Finding the
> ephemeral port is discussed in
> https://www.cs.ucr.edu/~zhiyunq/pub/ccs19_tcp_model_checking.pdf; the
> SYN
> half-open queue side-channel they mention is still present in Linux
> 7.4-rc3 (aebb72744764). Our application
> periodically sends and receives up to 4 MB so the window size can be
> large and makes it easier for an attacker
> to guess acceptable sequence and ack numbers. The attacker's guesses
> consist of two packets: one packet
> guessing the sequence + ack numbers, followed by a RST. With our
> window sizes this is a few million packets
> compared to up to 2^32 packets when the sequence number has to match
> RCV.NXT exactly.

I do not think 2^32 is the right baseline.

An attacker able to queue a forged segment can already corrupt the
byte stream, for the same number of packets. If your application
authenticates its data (TLS or similar), the corruption is detected
when the hole is filled and the connection is closed anyway. If it
does not, the attacker has something much better than a RST.

So what e00431bc93bb gives the attacker is an immediate and clean
reset instead of a delayed one. That is a small increment. The weak
part is the RFC 5961 5.2 ACK check, which only requires the ACK to be
in [SND.UNA - MAX.SND.WND, SND.NXT]. With 4 MB windows, this is about
10 bits for the ACK and 10 bits for the sequence, as you found.

> I tested against two
> computers running our application and it worked as described. Is this
> something that Linux would consider
> hardening (perhaps by fixing the ephemeral port side-channel or by
> constraining the RST if possible)?

For the RST part, I do not see a useful constraint. Anything we could
check on the RST (sequence, ACK, timestamps) is either already guessed
by the attacker at this point, or optional: segments without a
timestamp option skip PAWS, and RST are accepted even if they fail
PAWS. Reverting e00431bc93bb would bring back the problem it solved,
without changing the cost of killing the flow.

The port side-channel is more interesting, since it is a prerequisite
for all off-path attacks.

>If not,
> I'd appreciate any advice on what our application should do. I don't
> think we can use TCP-AO for all nodes in our
> network because some nodes are behind NAT.

TCP by itself does not protect against an attacker who knows the
4-tuple and can spoof the source address, especially with large
windows. If this matters for you, the transport needs to be
authenticated: WireGuard, IPsec with NAT-T, or QUIC all work across
NAT. Your application should also be able to reconnect and resume.

Thanks.

>
> Thanks.
