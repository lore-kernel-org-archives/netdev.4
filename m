Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795528774;
	b=cfy94UzTIzXQa6QLNAl0DTiATbQ0ibZbB5SRrLxyHlHs+87jdibM9FgiS9E6Zb55q3vX
	 ySJOC22w4jhui4s9eFi40XjpXiVfva6cH7efd0c9jpsCINg5YjqsHfBAIgfbBNe8+HbBl
	 92Rqr0yl8sGgdo8R1/V7Fe8C9NQb//loS9Ks+6EAivGYylX+6V5nxiRQn3LL92ALfmSn6
	 caRTI0jCUiWVRaC0dGLni4kJPIQ2H1hH4gOmBuvwlldSEUcBchacFn4E6Y2PzOC+NngBI
	 2Qn5wMYrU2b7T9dw0gGYd+AcpTGfiz2cmrIcU5S5rzfsro8t/Lpitos7zoJcjG6n+wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qpFgKtElV9OS+Bnv/pikSwsp/xn6gP6bke3sjNELLu4=;
	b=nrvoYI3Bk472aFOrEhXRUMhcZf5tBGgumY2w3yC/RfaXEHftWtpcoiJOkje2B7dkZGAu
	 E/v5ZUEDC90aTx9EaDE1qPIN461siIHU1LNd2aWol53E2W7Cf5l8j6/sf9q2IwK193Ta0
	 KWrIXIqJd6IiZ2oNIlTnqTBwcNC1xJm+ed4GWzpOHyQvlK6LxwVF3P4MUeIcYBwjMK8+z
	 +GId20zfyuF6WZDwjn3nQvgi8bcsS+CeSCZrs3oX0/jtcpXUTXvkAwi84tcMGf44AHpMx
	 wLYctI+0zhjzBUSXwS9VS/3v3D9v+OTwQ5mElBfLKFu6Xj+Xmsjaoud/y0h5obd1dwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JCtS1Yl/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA59606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA59606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCtS1Yl/
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5127c7abd5so712583366b.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795528773; cv=none;
        d=google.com; s=arc-20260327;
        b=X/yk5BwiY6G29W4nvM7qvZAaT3aJaWbWpKsCXQeFzAxlUBhkWlriV9weOWMJiaB8MT
         HgcBSVoa0a5WSzDyXe6Y205X2C9i4IZSbCLRiKdHPV4GE2Yu4QBQiDiy0JeJNDcF9Lmb
         x5Hkl+jjpFiBITu+Udkn3BW0pfnZ/ITmamOFlkKsZNyLZ9595rhZzWW/LAJ8/nwLnZqd
         V6T9JJaBG8M7KjkYaKfpJuHDF8Tm1Yk1YTwT8aGjYGgEuck+rCVV+EoXp+rcpFD5OBZw
         rx4A/UcgMdpk5VAnUcaBpvS277Mi2jVHju0ZpkneUvcmiyQxdUOQX0EqbNSHm9Dlf60m
         iqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qpFgKtElV9OS+Bnv/pikSwsp/xn6gP6bke3sjNELLu4=;
        fh=cQnaQKIoO5fNYAbxB46wnY0jmT064kQ//Z1pRD6yJBE=;
        b=hDbxtFT7j936QBbAVKdZK4xd5dZp532GqUH97HzW8mV3f10F0GD8W0SDsJwho7R72h
         DWRo4KgfVWd41tQz3XyvgzZcKDbszfdce2wrN6vrag9kdfXoYDU3AR1dZqvlOYzBz3zn
         eYXxWblV58cbyoyW2SxIM9esLMZSs459fzlXZPGYsmQUNIXfnCLuMROIYzEOtiAFYNuE
         hZULRSyGesUfjhuHpJV/ogZul90weyrxkwDnZNRRwL1RXgz0KSNq/MZStSVpZUz3JIXM
         Pb/OY7BqfNLE+UxzBM5qKE/npLjeA2WD07QqgW0PHmrXBT5ogLGmzf29iHqkqSO9QTTd
         JiUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795528773; x=1796133573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qpFgKtElV9OS+Bnv/pikSwsp/xn6gP6bke3sjNELLu4=;
        b=JCtS1Yl/Y17zVZhfE3l1Viu632QyFS1tjeT5g0NtkA+YB4Hq10cNfMEFHIA2RV1aFN
         h34peVv6+Z8q54KfDpyRIBEHa2Du751U0/WXkEl+edPtxWAkBFF0KwV69X5KAgwfbBx8
         86/4fHDbRcwdpOQoMZ8ucf666nauR0+RhoIrYHDFjPjHDDstrIdpudzlsLw+uSGpS8wQ
         YnjcnTL+EZRdIuoQTUPKEL3K6jjjxdYgOL+yPgautklULDarcsMX+WNQ+tgVCjTeBoEs
         /F15iJA1eT6A/FXhlzLIcq4wzUl4y7Rx+dvV9ESzi6yaG7CA5kuQrd4xExxVhHA+iA95
         zd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528773; x=1796133573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpFgKtElV9OS+Bnv/pikSwsp/xn6gP6bke3sjNELLu4=;
        b=G8+v0ZBD/ixhc7MIN1r9aZ31GFUwU+QonALkBIrZ+op0FwSGBzVUn0fV7wLUcP26Fu
         Dn+BjTJsvRHUh/XdHlqAOXI+eg4rci578zvnaQL2QlenPtq1aTU6wn4NGjRlPF1LdYhj
         1JKIty0q3fc4NCwouRec8QUd7H8XtUJ7I2jMao9gBZ8Hi0ON2lqHyDFSKA42KPhn4GgD
         NbVIjVIQb+6w4VOm/bySNanNiY7urPHTmrDMlMR0LpbJ06eM0keZEVjPVeun0c6VJK8W
         G8ME/kI/MsYKYOoFxliBgEwLYqHbNdfmlblKLCzFIXZGLDP4FQh+7CFKuyCWSguKyffn
         PZVg==
X-Forwarded-Encrypted: i=1; AL+hErFfAysqVZFesOus9+HZGsN4aVzGwifOv7lVSLIqrkXazC51IElHQB2/fwhABES31CZC3HnBekc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TxhMGDToxMDRumVFlpLMraQemLsQVKdioHkeVPu47BvV+V4sc
	vaszu9tg0AwNtf3cvIZ+IJic6XGRHSRnNtvegpYZWcHajcCMsDEw/9KsPY+9sVhEksjr6A7gZon
	ymsrcDEGz9JWsV0jaJdYEkoo3yuHtYFfczEei
X-Gm-Gg: AZFdTZe3ZLbnURbh6xD+/ctpHYeiQpMpiFheVZxjtZMsCnfc35Jvj2e4SW9mf1pE7A0
	D7D6WYA1TQ5HxDE/RuUmFWcAtJaX4j7MW5DLIv+988uicZGrTJatNvj9qCfLf+Kxlf+xl+NbP3D
	wHg1YHTT5vi6jO+hxUWUbc+8TVUgUo72kHFPjp8M5Nl2ZiFuXWDo887G+R6FFkjLWhKrmG5Mauv
	CSGxsRblYkGFDGc3m/l9wtBxkGJBvAplzy9z/qsZX9ZnDL3YAfrp4wbFXFbVBS8hsufDMg4XXk8
	xEM8XSaf/pUT1KXParJhGfXEvQD/vVMlB2qiP+FqKMtuB3H19RVgvikoCZQoB2M+kguALbZ8QKu
	C+drUFm5x3J0hQ29SHMwxyDIm0IbT/Ma8Fv5KrBcf4lt05Hn/urpb/VPxKm2GiNP0jB+yHPi/cg
	iYS5JupOIS8cbJgoCMilpxE6HzxPYBMYFpS1nSNWbwFRUv5hbM
X-Received: by 2002:a17:907:ea94:b0:c29:f5d8:9c73 with SMTP id
 a640c23a62f3a-c513a9aa815mr1262297466b.34.1795528772830; Tue, 24 Nov 2026
 05:59:32 -0800 (PST)
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
 <CAL4WiiqGjJFDEWT+2NgNbLKrB0E=_jFxidEFKzqcmB5r46uMOg@mail.gmail.com>
In-Reply-To: <CAL4WiiqGjJFDEWT+2NgNbLKrB0E=_jFxidEFKzqcmB5r46uMOg@mail.gmail.com>
From: Eugene Siegel <elzeigel@gmail.com>
Date: Tue, 24 Nov 2026 08:59:20 -0500
X-Gm-Features: Aa3M54rEsnTvaf2zgkGa2axruVKuObYlAdv4uI9G9VUAadmmwMkuXqQuztyS_O8
Message-ID: <CALkdYjV4rvsVBkZW67gwR-=ChDH0uEA5Jpp0SWpHpK=whvnDUA@mail.gmail.com>
Subject: Re: tcp: question about RST at SACK right-most edge
To: Eric Dumazet <edumazet@kernel.org>
Cc: "ncardwell@google.com" <ncardwell@google.com>, "kuniyu@google.com" <kuniyu@google.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> But note the precondition: the attacker must first get a forged
segment accepted in the out-of-order queue. This is the blind data
injection case of RFC 5961 section 5.2, and its cost does not depend
on the SACK rule at all.

After reading the RFC, I understand this better now. So the SACK rule
is not the issue.

> The port side-channel is more interesting, since it is a prerequisite
for all off-path attacks.

Is the half-open queue side-channel known but a wontfix? I saw it
mentioned in the linked paper (it is 9-B in Table 3) and decided to go
digging.
Basically the off-path attacker fills the half-open queue of a host to
1 entry from full and can figure out whether the queue was filled (or
not) by their port guesses.
First, they send unspoofed SYN to fill the queue. Then, they send a
spoofed SYN to the host for a known connection the host has and try to
guess the ephemeral port of the other side. If the port guess is
right, the host sends a challenge ACK to its peer and the queue is
untouched. If it's wrong, the queue is now full and SYN-ACK is sent to
the host's peer who might send RST back to the host (and remove the
queue entry). If the attacker can send an unspoofed SYN (with window
scaling, but without the timestamp option) to the host before the
potential RST arrives, they will either fill the queue and receive a
normal SYN-ACK (either the guess was correct or RST arrived first) or
they will receive cookie SYN-ACK (either the guess is wrong or an
unrelated entry was added to the queue). The attacker sets no
timestamp option so they can distinguish which one is the cookie
SYN-ACK.

It would be nice if the side-channel was fixed, but I can't think of
how without causing other problems. We can deal with this in our
application by reconnecting as suggested.

On Mon, Nov 23, 2026 at 4:44=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le lun. 23 nov. 2026 =C3=A0 01:49, Eugene Siegel <elzeigel@gmail.com> a =
=C3=A9crit :
> >
> > Hi,
> >
> > I think because a TCP RST is accepted if sequence number matches the
> > right edge of right-most SACK block
> > (introduced in e00431bc93bb), it is easier for an off-path attacker to
> > forge a TCP RST since they don't
> > need to guess RCV.NXT. If the attacker gets a forged out-of-order
> > segment queued, then they can also send
> > a RST with sequence number at the end of the segment and cause
> > disconnect.
>
> Your description of the mechanism is correct.
>
> But note the precondition: the attacker must first get a forged
> segment accepted in the out-of-order queue. This is the blind data
> injection case of RFC 5961 section 5.2, and its cost does not depend
> on the SACK rule at all.
>
> > To forge, the attacker needs to
> > guess the sequence in window, ack in acceptable range and know the
> > 4-tuple. The application I work on is a
> > distributed network and it is possible to know the IP addresses as
> > well as the listening port. Finding the
> > ephemeral port is discussed in
> > https://www.cs.ucr.edu/~zhiyunq/pub/ccs19_tcp_model_checking.pdf; the
> > SYN
> > half-open queue side-channel they mention is still present in Linux
> > 7.4-rc3 (aebb72744764). Our application
> > periodically sends and receives up to 4 MB so the window size can be
> > large and makes it easier for an attacker
> > to guess acceptable sequence and ack numbers. The attacker's guesses
> > consist of two packets: one packet
> > guessing the sequence + ack numbers, followed by a RST. With our
> > window sizes this is a few million packets
> > compared to up to 2^32 packets when the sequence number has to match
> > RCV.NXT exactly.
>
> I do not think 2^32 is the right baseline.
>
> An attacker able to queue a forged segment can already corrupt the
> byte stream, for the same number of packets. If your application
> authenticates its data (TLS or similar), the corruption is detected
> when the hole is filled and the connection is closed anyway. If it
> does not, the attacker has something much better than a RST.
>
> So what e00431bc93bb gives the attacker is an immediate and clean
> reset instead of a delayed one. That is a small increment. The weak
> part is the RFC 5961 5.2 ACK check, which only requires the ACK to be
> in [SND.UNA - MAX.SND.WND, SND.NXT]. With 4 MB windows, this is about
> 10 bits for the ACK and 10 bits for the sequence, as you found.
>
> > I tested against two
> > computers running our application and it worked as described. Is this
> > something that Linux would consider
> > hardening (perhaps by fixing the ephemeral port side-channel or by
> > constraining the RST if possible)?
>
> For the RST part, I do not see a useful constraint. Anything we could
> check on the RST (sequence, ACK, timestamps) is either already guessed
> by the attacker at this point, or optional: segments without a
> timestamp option skip PAWS, and RST are accepted even if they fail
> PAWS. Reverting e00431bc93bb would bring back the problem it solved,
> without changing the cost of killing the flow.
>
> The port side-channel is more interesting, since it is a prerequisite
> for all off-path attacks.
>
> >If not,
> > I'd appreciate any advice on what our application should do. I don't
> > think we can use TCP-AO for all nodes in our
> > network because some nodes are behind NAT.
>
> TCP by itself does not protect against an attacker who knows the
> 4-tuple and can spoof the source address, especially with large
> windows. If this matters for you, the transport needs to be
> authenticated: WireGuard, IPsec with NAT-T, or QUIC all work across
> NAT. Your application should also be able to reconnect and resume.
>
> Thanks.
>
> >
> > Thanks.
