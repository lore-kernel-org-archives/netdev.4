Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622977;
	b=gKYoC2AI2z/tUG9JpfcW1C6yYP7JyDb59o7Y3pVYaoPNuYLvrzQXLkQ1AACU07KoSMly
	 poN2fx7MLqBFJptgiHfwK+LYX9YBm2aO/n+C/qK61Evv1kB8pCmb8SgWpC5GVUHvg5wj/
	 lf1JH0D1ah8yb5RVjPZCwfzQGv2ZwXVR1H56+0BBdmaxReM9FKKWuPawTz4hgHGZoDd83
	 V1r3Eezoj8ldM6EtI1C6eqbNoz7RkgniiVA7QT1sHaTGjHTWxYtMyAnXNAByayN/cATKh
	 QVx4ZjyEmLNj4AIAo2wtkfVsadlcVERxIHadAkAcYe9gtJJJlHGjIa1qSssWkA+zqMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
	b=gZ5E9z1Frv+qPLm6YLi25ydNelHX5p69gzkbunvhqBqJebTxlw1tL/JIJd+l4m3c/x/H
	 VlKdqW/O/O3pgbtjTZSj5A3wKlgm7GAc/MEp4oRGpm/WB6vUSqRWKeRCeXrkVJh/LAD6a
	 IhEvdAkljBVVj9TTPn2RNJjpr0+8iHujSjd6kukn2cIozFYLszKtciUY39pjMzF5ktm+9
	 P12kdlBqukJ568jzxc/dkbYRyI9uWMFja9uASJfrEH4aJ9Yj+/TD03OjoO6hzwtEPfGqD
	 3UPdH6IUpvNHCooXD2wMDRu05KM07MbBS9LpLOpHwHm6BApHz/wuD3yh/bx6bm+GpXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGdvFyZb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D867B606A32C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D867B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGdvFyZb
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so1934070b3a.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622976; cv=none;
        d=google.com; s=arc-20260327;
        b=eszgVlRLax8UHpgctSTZK7jsPT9qUu5vqdHzifkrQG96Sr8stMlko2WiCCdSu/0J7q
         dWjOSUCtHC+2b/AUDvHcayjsKhk81NE3XvidRJZOr65YYbQO4I7D8ohjowWlMlgBz+lQ
         i0rPZ8Y0nVBsD0uGHTM9OjZL0AuaZ0q0hKs9wMsb4qlGl+wqsbcda6SoOrLLp78Z5ubZ
         viQo5qDqhSypou58TtAyL/FgnxQy9dfZU9D0p/RZ/C0fbYLiey1YTCFYPs7Tz0Xf4n+V
         SQCWNVyLA21ZV+TxQMsBsqE+n5ARN4OyKVJ4hZ3c0WfocwOOM6W9RMZ6O7/q8Ad25g0K
         Q1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
        fh=Q44qy7rVmEssU9q4ascC//HzX7jl2aqKOhPuYMvWMzg=;
        b=akQQUaxcVTjfRilX090f9npvdowXklzz/eKdpn9kqqVZu3+dbSU8NZILyT/WlB9gYn
         J701uj4Xib3RxGdODBhBuWnuQyKcTghxGG6hXuDxRpOt8ewfGjeBrDfC314ogFxyLHq3
         GxFbip0KuioI8Gjvbuu4JJyUrmkxJYTaH4JKR50pBkDRXVo3hfZh1ISCDyXHyUqRdIb3
         VYzPA0kw53L6eMuPcmEew+P4LXHy2j9XUhLri+WYaBmSI++YBV08aY9UFB8JPaMOpBZP
         08SIuJ5MRuhJR6rKM/zxPwSdtNWWTTku9dhq3karmuTX0zaPwjxBXKT+zIqtxgpSNz3U
         vH8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622976; x=1796227776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
        b=RGdvFyZbnMzNIxg36iRggwLlKAwT0D2LJK5qIOQEokaFn9B/SqNAhRJJ6ajydAMEdv
         jeeRJ5zHBU6TDPEb4o/EjfOgDDi6q9p/h9+pmtoJ5xyUqPTjEaTrMIvZrC2n1t2Ce8QC
         zH53VNmgHFtJxqLXblMQrg8+ULfuqxKpHjShKn1LCGkU9p1gBycyLMbokKZqHsipyox3
         gaTpRp19sCmfI0tKscIXN8Hk40GiG0v6tKVhHzSbLnuI6cKGWUyhOsPY4e20/JmbKJ7B
         KT6CyEJnlZBM2N491xGlvktrqXeb+9QvIJ3E3p//lkADFkpWcBFer5DAEB6qoJD0ijmu
         Sihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622976; x=1796227776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8edI8FeQSZp9/9wYopp3WXqEDb0aEYd4PyW+vHqD04=;
        b=byQ6TPFDpszBANGI7CzNbnuJx/bWzkKuOBqd5mcxMfo/s5anyRfVXQq3FcPluBGyDb
         9HWK6yncBYzcjdv3NOtDRG05TmMo36A2A/r3EyIeJ0Aqxyf9pCBYGeSSbe4wOTESh3OP
         wl3pBceginQpYJ3npHUwpYr7EnVJkArMIlOKQqnVgVPRkwv26hl9hArvbTUgUob4vces
         069v9GN3gTE6MoyDW/hjIRv7XO+uPDeIa9ehwFyGBjQWEmMDXUdj/5kBMKmSU7B1kovT
         nYq+CMBkOEoOsn+9h6e8+sPmEQTh8Bm1uI3G0YkbL4/xU67v2yHK7oOa3wjiLZyx0k9V
         RO0w==
X-Gm-Message-State: APuU4Z99uWjaZplW/5oyP7kgnrs8O9ywnuAxrk3wJppEnHgnmCJAVa55
	68Dtj3ThUJcRdTJLv2W8En672oM4jqcFcrXD55ZeCUosWFWqNXHC1xdCnE/rXtOwRgZP2VQqN9I
	2KQvGwHlBctry394jL9si+QWxzYqPQ/w=
X-Gm-Gg: AZFdTZdsVogS7txmWfp4TcZNOnRNZgZpvwM7Y2vhxOx3yQHHw8TBptDWNxqSfLunVMW
	zyCBIL0eeRf2PoVfiTCoFcb5iighlOEUQin517npDnoFd+ftvuyyZcyY24jfyLkEehtfFfOnBno
	8UgaYWHDHr/NMTdaGvgdvKiAHdhfdUm9lnMPJyxshjVejm59u9ChYOyqIMgFi27k4oZAEBUnh9c
	MfhfCdkq6UH/WVAwmdWfPWfWFpwi3oJvChdunNGRIP4jgYc6LnZ/E4pMvQJ2xGqsPG1vigB/lwT
	w+cI6lfLzvyo6+MbpwSoDQLi9cO3SjBv4wmV9pYoXOYRkDWXJWQyi6sqk2zrJ4/TBDx6ku+pnVZ
	XeSAQbY6wBxaVziDVEJEwRrXZVNlpd0PGP+KdgKfzHXdnDUwwCnkHaA402o95Mt3qxQBYHniwau
	lp2/hsiuUdCiky1Jqivsnu70JSMzhNQ11tNHE48Lf91URjjORcZFFgW455z4IAoVXuJyWz
X-Received: by 2002:a05:6a00:ad05:b0:8a0:70ff:ab28 with SMTP id
 d2e1a72fcca58-8c87daf37damr15090565b3a.60.1795622976032; Wed, 25 Nov 2026
 08:09:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <a0b0796446aa6da7e62134343e27abb459c3e4cf.1795393691.git.lucien.xin@gmail.com>
 <179548327264.3135.6491698928014688203@kernel.org>
In-Reply-To: <179548327264.3135.6491698928014688203@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 25 Nov 2026 11:09:24 -0500
X-Gm-Features: Aa3M54rOBsjgMkrX6FiWjub5OGP-lBrvCJFM9rh8E12fgXwHp5rULcB25ZvsU6o
Message-ID: <CADvbK_f42EbbC0fgn1a_HkrgAbqgmtGExogvNq6CZa892tz_cQ@mail.gmail.com>
Subject: Re: [PATCH net-next v19 07/15] quic: add connection id management
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, quic@lists.linux.dev, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	metze@samba.org, mbuhl@openbsd.org, tfanelli@redhat.com, hepengtao@xiaomi.com, 
	dreibh@simula.no, jamie.bainbridge@gmail.com, linux-cifs@vger.kernel.org, 
	pc@manguebit.org, linkinjeon@kernel.org, tom@talpey.com, 
	kernel-tls-handshake@lists.linux.dev, cel@kernel.org, jlayton@kernel.org, 
	steved@redhat.com, hare@suse.de, aahringo@redhat.com, dhowells@redhat.com, 
	matttbe@kernel.org, mail@johnericson.me, xiyou.wangcong@gmail.com, 
	alibuda@linux.alibaba.com, jbaron@akamai.com, illiliti@protonmail.com, 
	sd@queasysnail.net, marcelo.leitner@gmail.com, daniel@haxx.se, 
	andrew.gospodarek@broadcom.com, mef@scarletmail.rutgers.edu, paul@jakma.org, 
	kuniyu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:21=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] quic_conn_id_retire() (net/quic/connid.c) handles 'retire the
>   last live consecutive CID' with `if (WARN_ON_ONCE(id_set->use_count <=
=3D=E2=80=A6
>
> --
>
> quic: add connection id management
>
> This patch adds struct quic_conn_id_set to manage source and destination
> connection IDs. It provides helpers to add, retire, find and look up CIDs=
.
> Source CIDs are also inserted into a global RCU hash table, which the RX
> path uses to look up the socket.
>
> > diff --git a/net/quic/connid.c b/net/quic/connid.c
> > new file mode 100644
> > index 0000000000000..1ddf8bc9b7910
> > --- /dev/null
> > +++ b/net/quic/connid.c
> > @@ -0,0 +1,313 @@
>
> [ ... ]
>
> > +/* Retire a connection ID by marking it dead, then remove consecutive =
dead
> > + * entries from the head of the list. The caller must ensure the numbe=
r falls
> > + * within the consecutive range [first_number, last_number].
> > + */
> > +void quic_conn_id_retire(struct quic_conn_id_set *id_set, u32 number)
> > +{
> > +     struct quic_common_conn_id *common, *tmp, *retired =3D NULL;
> > +     struct list_head *list;
> > +
> > +     list =3D &id_set->head;
> > +     list_for_each_entry(common, list, list) {
> > +             if (common->number > number)
> > +                     break;
> > +             if (common->number =3D=3D number) {
> > +                     if (common->dead)
> > +                             return;
> > +                     retired =3D common;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!retired)
> > +             return;
> > +
> > +     if (WARN_ON_ONCE(id_set->use_count <=3D 1))
> > +             return;
>
> [Severity: Medium]
> Can a peer reach this WARN_ON_ONCE() using only its own
> RETIRE_CONNECTION_ID frames?
>
> For the source set, number comes from the peer. The v19 changelog moved
> this guard below the duplicate-retire check so duplicates would not hit
> the WARN, which suggests peer-chosen numbers are expected to get here.
>
> A retired source CID that is not at the head of the list is only marked
> dead. It stays on the list and stays hashed. quic_conn_id_lookup() does
> not check ->dead:
>
>         hlist_nulls_for_each_entry_rcu(s_conn_id, node, &head->head, node=
) {
>                 if (net !=3D sock_net(s_conn_id->sk))
>                         continue;
>                 if (s_conn_id->common.id.len !=3D len ||
>                     memcmp(scid, &s_conn_id->common.id.data, len))
>                         continue;
>
> Later in the series, quic_packet_get_sock() in net/quic/packet.c uses
> this lookup to route the packet to the socket and set cb->seqno. It does
> not check the dead flag either.
>
> Take a source set {0, 1, 2}, all live, use_count =3D 3, with the peer
> using CID 0:
>
>   peer sends RETIRE(1), then RETIRE(2)
>     -> use_count =3D 1, CIDs 1 and 2 are dead but still hashed
>   no replacement CID is issued (count still includes the dead middle
>   entries, so max_count or QUIC_CONN_ID_LIMIT may already be reached)
>   peer sends a packet with DCID =3D CID 1 carrying RETIRE(0)
>     -> quic_conn_id_lookup() still finds CID 1
>     -> quic_conn_id_retire(id_set, 0)
>     -> WARN_ON_ONCE(id_set->use_count <=3D 1)
>
> RFC 9000 Section 19.16 allows RETIRE(0) in that packet, since sequence
> number 0 is not the DCID of the packet carrying the frame.
>
> On panic_on_warn systems this would be a panic the peer can trigger
> remotely. Without panic_on_warn, the retirement is silently dropped.
>
> quic_conn_id_retire() returns void, so the caller cannot tell a refused
> retirement from a successful one. That means it cannot turn this case
> into a PROTOCOL_VIOLATION.
>
> Would it make sense to return an error here instead of warning? Or to
> reject packets addressed to dead source CIDs?
>
> No caller of quic_conn_id_retire() exists in this series yet. Whether
> this fires depends on how the RETIRE_CONNECTION_ID handler in the
> follow-up patchset checks the number before calling it.
>
False.

The WARN_ON_ONCE is a defensive invariant for catching programming errors,
not a peer-reachable path. The RETIRE_CONNECTION_ID handler in the next
patchset validates the sequence number before calling this function and
ensures replacement CIDs are issued before use_count drops too low.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/cover.1795393690.git.lucien.xin%40gmail.com
