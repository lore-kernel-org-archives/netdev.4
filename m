Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460935;
	b=EkmlqgsvsuvgeuusDs0h8n6gE5AytPEuBJ3zXkJf0CvFse/8u9rHbYmwE7Mr+Jt7Ce27
	 kKGakuWTyJZf9v2qx4ITVhGKBRPBXp0iVeHjWOY5Vt5RK+VlnCfK0kfJiJ4h43rdX4Ucz
	 c1vv27KZDk3unARwlu5nJ0+WssGWrBRcu3pC/Bre0msqO1H261wcs/YEahFEVaF6eP7UH
	 +2TxGNtSRi6vOAMPmQyit0NXTBVDZsNZDFUzdP0L4RPU6CTr7pUhWyupyPq9Pq0wuDMpa
	 d63W7LweZcCcaY/Y41wW3RZqHzEuFBeZiG3xXDxXTwaBmfz2q3kPmhhZ7fLorI/Cikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460935;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1Bpf8g/Kvm3EhHimBz2qrE+GvhgrWU9i9uAz53dEKLo=;
	b=kxUSVyI4i3gJw3EI1bpJcP3+4eN8kntaqq/ylpSRVN9hqYQUhCoTSVfzZn8i4rnj/Sb4
	 iJ7ogxdaE7Ui81n1b5vqImk3e9zkQ/Wy4w7+wc0zY5r0tZgzYBpZQRYFY4cgbIYwbfavx
	 zOnqNxMwANcf5IH0X7y2TcmCGGAXmLNGpplMO1pHxmPu1RGPgOakaXdkDkfsN4U3g4wez
	 ZgwWOkJykEeqb6VO3Br5ZAUrkPBQ9mkrIG3Mgt4IbOrsbpRaOJ2vyTQbyU+ErbnI4uycA
	 FKxugbrToyq/9bz10nyx9PCIR9vAmM0XsKI0wAEJ5P/qc9auoILsplW0nBbQRZRUePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8ET3wPO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F6606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O8ET3wPO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF291F000C4;
	Mon, 23 Nov 2026 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460934;
	bh=1Bpf8g/Kvm3EhHimBz2qrE+GvhgrWU9i9uAz53dEKLo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=O8ET3wPOpU4y0V16ga9GzVE16wz8X6Qh6V/mLf9HYYKFZXMxcSbZb9xO/gqxz8L+z
	 U3Hkdl+vrTe3gf92zJlKo4hx6iKyc3p1YA4hxcWBhOrUggwiTvG2ztibk9Hvlg+xLx
	 pj94vQHokU88A/SsVh00ctx6gwWEC8TEZZmN8S2vc3ZbCri+Egvci+30SQDlHdBqXv
	 NckarYmuw3Z1Qnp5pHVFo3j/zeb9Umaike+kgG3RZv8e8UJ/CKv8KqfGBTGJyLkkyj
	 sppU2M6cO1nh5Yt/p/q3encHlxZV4KXMzZ7h7UIlnoBbeQbHE7UwyMHWL47eY25fM/
	 /A5FKBQpSeuYg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com, stfomichev@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: Re: [PATCH v5 net-next 08/13] selftests: xsk: send UDP over IPv4 or
 IPv6 between the interface MACs
In-Reply-To: <20261119164636.1071385-9-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
 <20261119164636.1071385-9-maciej.fijalkowski@intel.com>
Date: Mon, 23 Nov 2026 20:08:50 +0100
Message-ID: <87y0ajpdq5.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:

> xskxceiver sends frames of the loopback ethertype between made-up MAC
> addresses, and its XDP programs redirect every frame to the XSKMAP.
> That suits a veth pair that carries nothing else, but not a physical
> link, where the peer NIC filters out the made-up addresses and the
> programs take neighbour discovery, LLDP or SSH away from the stack.
>
> Send the test packets as UDP between the MAC addresses of the two
> interfaces on any link. Each endpoint takes the IPv4 or IPv6 addresses
> of the flow (--src-ip, --dst-ip), the MAC address of its peer
> (--dst-mac) and the UDP port (--udp-port), and reads its own MAC
> address from the interface. Over IPv4 the UDP checksum is left at zero,
> as IPv4 allows; over IPv6 it is computed from the known payload.
> PKT_HDR_SIZE and MIN_PKT_SIZE now stand for variables that
> xsk_set_flow() sets, so the smallest packet grows with the headers to
> 64 bytes over IPv4 and 88 over IPv6, and a verbatim stream adds up the
> descriptors of a packet for its IP and UDP lengths.
>
> The XDP programs redirect only the UDP packets to the test port and
> pass everything else to the stack, all IPv4 fragments included. The port
> is written when a skeleton is loaded, so it also reaches the shadow
> endpoint's copy, whose programs the local side attaches once
> BIDIRECTIONAL swaps the directions. XDP_SHARED_UMEM picks the socket by
> the UDP source port, the test port plus the socket index, rather than by
> a made-up destination MAC, and xsk_xdp_adjust_tail() numbers a grown
> tail after the UDP header.
>
> is_adjust_tail_supported() copied all of .bss into an int with
> bpf_map_lookup_elem(), past the end of the int even before the port
> grew .bss; read adjust_value through the skeleton instead.
> is_frag_valid() now rejects a fragment too short for the words it
> reads, and pkt_dump() prints only the words within the length it is
> given, which is_pkt_valid() gives as the first fragment's length.
> write_payload() zeroes the bytes after the last full word, which the
> IPv6 UDP checksum counts.
>
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
