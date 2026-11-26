Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697598;
	b=Qdj1UKKI/PTAxQB8hH51Lfpyc82m64UMetFbCAASWbVQPiS0JGUvq8Cfw6TRCvskjgpJ
	 9SAK4qNd2CcyToHJvicuKvp32duv1tJsRAxOOtyhPKPaX0tLkjtBQuTPi8pUL1sf6sDNS
	 KdiQHTzlx8XMNLf8zcxwvLDT50Vy1xhma/Xzz7j/h+223pGbD2Sbxv/quTj5yXuYdonsb
	 IF01oeABfRq5TjY0Tj0FtAK6qtbsOx2k34kAz5qNAgSs4jXA3T3NigqRoPUE16xi2CE9n
	 zGoR5C+wg6ZpOuEi8nPcGvuPkx8HcOoqptYLrjxibJidRSBYuNmJTVTSk4CsKl74cjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
	b=rt4PBo8JJiV/85HhJgD8qTSSB2uiRJg9mcP4BpDBJXcj9CPHPm7C06CL2whvAf+GAcXQ
	 RUwz8Otlv+uFsKQUokEuqlAOSVCo8U+gxKpstWzwUiCnGZCRr+9cPExpsTxm7DfYA3C86
	 2kX9IXqkIbEUnXFHvVZq80T1ToDcGMVIR/QjKPQzfHXyLYIcDRUKEgQWCvfMXwiOxte4j
	 BeFqRRIrKl/03NAS0kMLV8SGnz0kpFi75sriwso3XoSB81vyzx05m4xvb4WZ3JjRsVAel
	 llfDl87+VmSypG5CEEBa0BgF9Py2+3qcDQbAjm0dmu/k4GjF01bhcLmUcO/HQKIQw7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FORWBKgw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3250A606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3250A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FORWBKgw
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1479a959aso5260351e87.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697596; cv=none;
        d=google.com; s=arc-20260327;
        b=BIlCzWE39jbVWmVqWdeU6Dd+cv87mhlX3vb/f1aVV0ZarRdwCQXqyAlhmJmHOx3GRF
         j6+CPrsVQE/xCFlT2I8ajDSimQa73B2/+2bnapcq+MQRq9HlZrqd6qKJlGQAs+kUBDgY
         RvS/Ttnx9YjHVcyl3pG2kdR4m2wxxSALv8nI0O8rXgWknPQAKw/9Mq8r39O9cYCK9xt+
         tAcfQhXlytW/nIRjmcUxKia+HLgaZUHgIK7v/rtUDVMEpBG4nlChHWxKPfLmjlD3MyLp
         0/TLLSzAzrZ56wXCozzB2J5cuCBCdHZIq9CvHEEj66X0MQ5sReV4f22OVRZSY5mUNo+Z
         4JjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
        fh=Y1pN0Po2ZmZjJtOnwIg4IPKagZ7dlfnIbUYh5evuiW4=;
        b=i5/ORq3vDduIcrS49NjVDRWsgreeGH8HvHzLI/UFMskCDPBOiVj1FT8dpFZK6yUEdP
         PoTs6LqmkKkMDL9Gn4Fm1YN7tFw3ucigg7R62b/UIxzwa4JsbAZQ+vDhpZOtihxoZ1Xg
         E1TXH18mJNyz5+KM7bQm+BGR0V1E+qEzfy05BsztEXzSaJp6V7mZtKj9rHi2SAxGVkXC
         K+QpkCEQVmW9gtnF57VIKChPp61IO6Cmg470610quIGb537sbjT/WBPJFtcul3bCIajL
         yeMJokMaIjsx3ut1HHC9XQWeVYDJmo2QqNlxTIRzeh76ZKrRPlD3YyfnvEZhztBwLou5
         aESQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697596; x=1796302396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
        b=FORWBKgwsA7he+yhIejYmX3C8mLyffMOydsVSolS5B9UxM/d6GN9EfR/WDQnPxM59i
         I8V6kZ/8BCzmnDAJZDiYTIggQsKvlYEoBOQ6VOaPjuRScNUe+Nv/34RmmjzPre8+QCii
         svin+SE79f2EIjvbqI+at/bTde6GLq2GkUerBK+q3/xO+kSqiqd390kpOWbo0xbmS3EP
         HhgnZyq1/RsPyte70TPtCraHQ1qJScwh0kGrn+u7cLEkNU1RZKh+x4HrDRvojD7cZ9+i
         7ElD/IEkweh4cSXSarOg4tsLELOaArmaKLCFc20DyW0O8+8DAbBqXtCU1of40mjEY1H8
         yXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697596; x=1796302396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGc9B3jyrGJ4akeMJZzBnHn2T1j3IVSiriGjwJai8GE=;
        b=ayWyNeRaDXfY0Ef5kws1WQwxVBr07jfLQ1DX1nyaGApgYHrEu1bBt0sbcDj2SYYGsS
         HepatoATHCDluvnMMjy5PMpyy/IvnKXAgHWPJ/V8SOqJkCAHnHbIvoNmKnghVcp0D2s7
         hyRW19CP19+lxlxvfuugM4cnklHUKGej5M5noRJeJtiZF6hJonCSUz3x+PB8v0CrHZbO
         3HOo+BjhtJaUk2aWMBHDkM9etiip1FeN2oMuN3ZVNkZSEA7CkGMTkDvACy/2o1vYM1kO
         S1vp/zoGjozf7g5jbNCVyfCmV4vtKYDGY1NEhtfG6ndtnlSUtkGt/4WlUXiNytJttVVY
         pndA==
X-Forwarded-Encrypted: i=1; AL+hErGEDGScDKQ3izF8U73VcxdQdYBevDElPvp6t976DrOi+6uSud1+lX4vO25CLIINrfJ+ZFkGRQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tWq4sZGdfdETvLW5zxg7xWxPk7O/R3GJlr/xFyWJ2sLsUW0YI
	QAtDUHND1MaSlxCgPKDxQOWMk9tIqz3G1lvwQtO9evyY0XUa/pasadTmlj+YUffIIlBkTTY9kDa
	vCVVR92OhZGbqy04oc0qUZsej7p4uaFs=
X-Gm-Gg: AZFdTZeJp0zUK0i/Ja9J0P6HAtDCjb03hjYds9KPWUHO+u5W22kisqAcsbmHvjnC+Mh
	ZgOq9MT9DKTD6+z6RFmu7ROxV3SA4vW/RAIc5762KyXBBRkr0c1+CLuz6aU1qulviTtUFtKIaR/
	dN9IyLwjs8iRNIxsOHswqVMz9b3ep9P4RMFIX2ZJZ3HnrCuP442gAPiI5FVu+AcfYEg8GkYotE7
	UPHZ+LvSei435M6NzdjuFA1M7SuY6/o20DSpvSH7AkRUrNiMj/eRxxYIid5hR0w2ZE7bO5U1vQD
	3ZflmuQJSi9yQdwUEcvbckaya7fj2rIm9JVvYoTT/A3glfxfSDBnOGFYV7tvY2UuvYfh3Ln2MLs
	yHAz1X77w0C7nQu1s9ghJthziwOzJ1iJ49o2gJg==
X-Received: by 2002:a05:6512:6311:b0:5bf:c4d2:b074 with SMTP id
 2adb3069b0e04-5c1bc81b1eemr5244475e87.55.1795697596151; Thu, 26 Nov 2026
 04:53:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124230228.3868519-1-graypanda.inzag@gmail.com> <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
In-Reply-To: <DN3TX43KWXO5.JWLJ9HO1C9K7@gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Thu, 26 Nov 2026 21:53:04 +0900
X-Gm-Features: Aa3M54ptuj7zEv__cM-ZP_znEaMpCD4YLDPrlyY2oJoeO2RPwi4yvnEBtuW6DHg
Message-ID: <CAO7ntTQ0bJGezMUFMoy=_Ns63Pw_1Tbw0_QKtXVoh2Wst26Orw@mail.gmail.com>
Subject: Re: [PATCH net] tcp: avoid NULL skb dereference in zerocopy receive
 with sockmap
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexei,

I noticed Kyuwon Cho already reported the ingress_msg copied_seq issue
last week ("bpf, sockmap: data left in ingress_msg is dropped without
moving copied_seq, and TLS RX then warns"), so I'll drop this patch to
avoid duplicating work.

Thanks,
Junyoung

On Wed, Nov 25, 2026 at 8:28=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Nov 24, 2026 at 03:02 PM Junyoung Jang <graypanda.inzag@gmail.com=
> wrote:
> > Check tcp_recv_skb() before using its result in both paths. Also stop
> > before advancing beyond the last skb in sk_receive_queue. Neither
> > check consumes data in the sockmap ingress queue.
>
> This should be fixed on bpf side. Other readers trust copied_seq too:
>
>   reader                             with stale copied_seq
>   ---------------------------------  ----------------------------
>   tcp_recvmsg_locked()               WARN "TCP recvmsg seq # bug"
>   tcp_read_sock()                    frees new skbs
>   tcp_collapse()                     BUG_ON(offset < 0)
>   tls_strp_load_anchor_with_queue()  WARN_ON_ONCE(!first)
>
>
> pw-bot: cr
